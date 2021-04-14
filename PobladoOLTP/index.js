const faker = require("faker");

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'Usuario de la Base de Datos',
    password: 'Contraseña del Usuario',
    server: 'Nombre del Servidor',
    database: 'Nombre de la Base de Datos'
});


