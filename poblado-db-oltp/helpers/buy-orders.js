const faker = require('faker/locale/es');
const nRegistros = 10000;

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

setTimeout(async () => {
    for (let i = 1; i <= 57; i++) {

        let resultado = await rest.executeQuery('insert into Buy_Orders(shipped_price, shipped_amount,item_id, branch_id, date) values(@shipped_price, @shipped_amount , @item_id, @branch_id, @date)', [
            {
                name: 'shipped_price',
                type: 'money',
                value: faker.random.float({
                    max: 30000,
                    min: 10000
                })
            },
            {
                name: 'shipped_amount',
                type: 'int',
                value: 70
            },
            {
                name: 'item_id',
                type: 'int',
                value: i
            },
            {
                name: 'branch_id',
                type: 'int',
                value: 1
            },
            {
                name: 'date',
                type: 'date',
                value: '2020-12-30'
            }])

        console.log(resultado);
    }


}, 1500);


