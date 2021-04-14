const faker = require('faker/locale/es');
const nRegistros = 130;

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

setTimeout(async () => {
    for (let i = 0; i < nRegistros; i++) {

        let peticion;
        let numAle;
        do {

            numAle = faker.random.number({
                min: 1,
                max: 57
            });
            peticion = (await rest.executeQuery(`SELECT quantity FROM Products WHERE id = ${numAle}`)).data[0][0].quantity;
            console.log('aqui', peticion);
        } while (peticion <= 1);
        console.log('aqui no', peticion);

        let precio = (await rest.executeQuery(`SELECT sell_price FROM Products WHERE id = ${numAle}`)).data[0][0].sell_price;
        let cantidad = faker.random.number({
            max: 2,
            min: 1
        })
        let resultado = await rest.executeQuery('insert into Bills_Items(product_id, price, tax, tax_type_id, quantity, subtotal ) values(@product_id, @price, @tax, @tax_type_id, @quantity, @subtotal)', [{
            name: 'product_id',
            type: 'int',
            value: numAle
        }, {
            name: 'price',
            type: 'money',
            value: precio
        }, {
            name: 'tax',
            type: 'money',
            value: precio * 0.15 * cantidad
        }, {
            name: 'tax_type_id',
            type: 'int',
            value: 1
        }, {
            name: 'quantity',
            type: 'int',
            value: cantidad
        }, {
            name: 'subtotal',
            type: 'money',
            value: cantidad * precio * 0.15 + (cantidad * precio)
        }])

        console.log(resultado);
    }

}
, 1500);