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

// Rutas
app.get("/productos", (req, res) => {
  const query = `
    SELECT
      p.id,
      CONCAT(p.description, ' ', pp.peso) AS descripcion,
      m.marca,
      a.animales,
      ROUND(p.precioCompra) AS precioCompra,
      ROUND(p.precioCompra * 1.25) AS precioVenta
    FROM productos p
      INNER JOIN animales a ON a.idAnimal = p.idAnimal
      INNER JOIN marcas m ON m.idMarca = p.idMarca
      LEFT JOIN edadanimal e ON e.idEdadAnimal = p.idEdadAnimal
      INNER JOIN pesoproducto pp ON pp.idPeso = p.IdpesoProducto
    ORDER BY p.id
    LIMIT 400;
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

// Esperar a que MySQL esté listo y luego arrancar servidor
waitForDb().then(() => {
  console.log("MySQL está listo, arrancando servidor...");
  app.listen(PORT, () => {
    console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
  });
});
