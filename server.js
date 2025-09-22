require('dotenv').config(); // carga las variables del .env
const express = require("express");
const cors = require("cors");
const mysql = require("mysql2");

const app = express();
const PORT = 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Conexión a MySQL usando pool
const db = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Función para esperar a que MySQL esté listo
const waitForDb = () => {
  return new Promise((resolve) => {
    const check = () => {
      db.query("SELECT 1", (err) => {
        if (err) {
          console.log("Esperando a que MySQL esté listo...");
          setTimeout(check, 2000); // reintenta cada 2 segundos
        } else {
          resolve();
        }
      });
    };
    check();
  });
};

// Rutas // TODO hacer el order by con por la marca en orden asendente
app.get("/productos", (req, res) => {
  const query = `
    SELECT
      p.id,
      concat(coalesce(p.description,''), ' ', coalesce(pp.peso,'')) as descripcion,
      m.marca,
      a.animales,
      ROUND(p.precioCompra) AS precioCompra,
      ROUND(p.precioCompra * 1.25) AS precioVenta
    FROM productos p
      LEFT JOIN animales a ON a.idAnimal = p.idAnimal
      LEFT JOIN marcas m ON m.idMarca = p.idMarca
      LEFT JOIN edadanimal e ON e.idEdadAnimal = p.idEdadAnimal
      LEFT JOIN pesoproducto pp ON pp.idPeso = p.IdpesoProducto
    ORDER BY p.id;
  `;
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error en la consulta:", err);
      res.status(500).json({ error: "Error en la consulta a la base de datos" });
    } else {
      res.json(results);
    }
  });
});


// update o modificar producto
app.put("/productos/:id", (req, res) => {
  const { id } = req.params;
  const { precioCompra } = req.body;

  const queryUpdate = `UPDATE productos SET precioCompra = ? WHERE id = ?`;
  db.query(queryUpdate, [precioCompra, id], (err, result) => {
    if (err) {
      console.error("Error al actualizar:", err);
      res.status(500).json({ error: "Error al actualizar el producto" });
    } else {
      res.json({ mensaje: "Producto actualizado correctamente" });
    }
  });
});


// agregado de producto
// --- Metadata para selects ---
app.get("/metadata", (req, res) => {
  const queries = {
    animales: "SELECT idAnimal, animales FROM animales ORDER BY idAnimal",
    edades: "SELECT idEdadAnimal, edadAnimal FROM edadanimal ORDER BY idEdadAnimal",
    marcas: "SELECT idMarca, marca FROM marcas ORDER BY idMarca",
    pesos: "SELECT idPeso, peso FROM pesoproducto ORDER BY idPeso"
  };

  const data = {};
  const keys = Object.keys(queries);
  let completed = 0;

  keys.forEach((key) => {
    db.query(queries[key], (err, results) => {
      if (err) {
        console.error(`Error al obtener ${key}:`, err);
        return res.status(500).json({ error: `Error al obtener ${key}` });
      }

      data[key] = results;
      completed++;

      if (completed === keys.length) {
        res.json(data);
      }
    });
  });
});

// --- Insertar producto ---
app.post("/productos", (req, res) => {
  const { description, idMarca, idAnimal, idEdadAnimal, idPesoProducto, precioCompra } = req.body;

  if (!description || !idMarca || !idAnimal || !idEdadAnimal || !idPesoProducto || !precioCompra) {
    return res.status(400).json({ error: "Todos los campos son obligatorios" });
  }

  const queryInsert = `
    INSERT INTO productos (description, idMarca, idAnimal, idEdadAnimal, idPesoProducto, precioCompra)
    VALUES (?, ?, ?, ?, ?, ?)
  `;

  db.query(queryInsert, [description, idMarca, idAnimal, idEdadAnimal, idPesoProducto, precioCompra], (err, result) => {
    if (err) {
      console.error("Error al insertar producto:", err);
      res.status(500).json({ error: "Error al agregar el producto" });
    } else {
      res.json({ mensaje: "Producto agregado correctamente", id: result.insertId });
    }
  });
});

// Eliminar producto TODO




// Esperar a que MySQL esté listo y luego arrancar servidor
waitForDb().then(() => {
  console.log("MySQL está listo, arrancando servidor...");
  app.listen(PORT, () => {
    console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
  });
});
