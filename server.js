require('dotenv').config(); // carga las variables del .env
const express = require("express");
const cors = require("cors");
const mysql = require("mysql2");

const app = express();
const PORT = 5000;

// Middleware
app.use(cors());
app.use(express.json());

// Conexión a MySQL
const db = mysql.createConnection({
  host: process.env.DB_HOST,  // o la IP de tu servidor MySQL
  user: process.env.DB_USER, // cambia por tu usuario MySQL
  password: process.env.DB_PASSWORD, // cambia por tu contraseña
  database: process.env.DB_NAME // cambia por el nombre de tu base de datos
});

// Verificar conexión
db.connect((err) => {
  if (err) {
    console.error("Error al conectar a MySQL:", err);
    return;
  }
  console.log("Conectado a MySQL");
});

// Ruta para traer todos los productos + guardado de la query en una variable constante
app.get("/productos", (req, res) => {
  const query = `

select

  p.id,
  concat(p.description, ' ', pp.peso) as descripcion,
  m.marca,
  a.animales,
  concat('$',' ', ROUND (p.precioCompra)) as precioCompra,
  concat('$', ' ', ROUND (p.precioCompra * 1.25)) as precioVenta

from productos p 

	inner join animales a on (a.idAnimal = p.idAnimal)
	inner join marcas m on (m.idMarca = p.idMarca)
	left join edadanimal e on (e.idEdadAnimal = p.idEdadAnimal)
	inner join pesoproducto pp on (pp.idPeso = p.IdpesoProducto)

	order by p.id limit 400;`
  
  db.query(query, (err, results) => {
    if (err) {
      console.error("Error en la consulta:", err);
      res.status(500).json({ error: "Error en la consulta a la base de datos" });
    } else {
      res.json(results);
    }
  });
});

// Arrancar servidor
app.listen(PORT, () => {
  console.log(`Servidor backend corriendo en http://localhost:${PORT}`);
});
