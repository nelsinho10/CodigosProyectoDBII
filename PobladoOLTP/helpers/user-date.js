const faker = require("faker");

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'OLTP'
});

// Numero de Registros de Usuarios
const numRegistros = 10016;

setTimeout(async () => {

    for (let i = 1; i <= numRegistros; i++) {

        let fecha = await rest.executeQuery(`SELECT [date] FROM Bills WHERE user_id = @id`, [
            {
                name: 'id',
                type: 'int',
                value: i
            }
        ])

        if (fecha.data[0][0] !== undefined) {
            // Obener la fecha de la primera factura
            let fechaUsuario = fecha.data[0][0].date;
            let fechaFormateada = `${fechaUsuario.getFullYear()}-${(fechaUsuario.getMonth() + 1)}-${fechaUsuario.getDate()}`;
            console.log(fechaFormateada);

            let resultado = await rest.executeQuery(`UPDATE Users SET registration_date = '${fechaFormateada}' WHERE id = ${i}`)
            console.log(resultado);

        } else {
            // Generar la fecha en el rango
            let fechaUsuario = faker.date.between('2018-02-19', '2021-02-02');
            let fechaFormateada = `${fechaUsuario.getFullYear()}-${(fechaUsuario.getMonth() + 1)}-${fechaUsuario.getDate()}`;
            console.log(fechaFormateada);

            let resultado = await rest.executeQuery(`UPDATE Users SET registration_date = '${fechaFormateada}' WHERE id = ${i}`)
            console.log(resultado);
        }

    }
}, 1500);

