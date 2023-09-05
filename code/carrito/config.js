var config = {}

// da valor a algunas variables de configuración

// carga variables de entorno en process.env
require('dotenv').config();

config.gae= {
  client: "mysql",
  connection: {
    socketPath: process.env.GCP_SQL_INSTANCE_CONNECTION_NAME,
    user: process.env.GCP_SQL_USER,
    password: process.env.GCP_SQL_PASSWORD,
    database: process.env.GCP_SQL_DATABASE
  },
  useNullAsDefault: true
}

// 'useNullAsDefault:true' es necesario para sqlite: http://knexjs.org/#Builder-insert;
// por consistencia, se lo ponemos al resto de gestores de bases de datos

config.localbd= {
  client: "sqlite3",
  connection: {
    filename: "./mibd.sqlite"
  },
  useNullAsDefault: true
}

// en Google App Engine el único directorio de trabajo es /tmp
// lo usamos para guardar los archivos de la base de datos
// pero se eliminarán cuando se reinicie el servidor
config.gaesqlite3= {
  client: "sqlite3",
  connection: {
    filename: "/tmp/mibd.sqlite"
  },
  useNullAsDefault: true
}

config.app= {
  base: '/carrito/v1',
  maxCarritos: 500,
  maxProductos: 20
}

module.exports = config;
