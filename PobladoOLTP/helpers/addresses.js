const faker = require('faker/locale/es');
const nRegistros = 5000;

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

setTimeout(async () => {
    for (let i = 0; i < nRegistros; i++) {
        let num = faker.random.number({
            min: 1,
            max: 174
        });
        let res = (await rest.executeQuery(`select R.id from Regions R join Countries C on R.id = C.region_id Where C.id = ${num}`)).data[0][0].id
        await rest.executeQuery('insert into Addresses(description, region_id, country_id, user_id) values(@description, @region_id, @country_id, @user_id)', [{
            name: 'description',
            type: 'text',
            value: faker.address.streetAddress()
        }, {
            name: 'region_id',
            type: 'int',
            value: res
        },{
            name: 'country_id',
            type: 'int',
            value: num
        },{
            name: 'user_id',
            type: 'int',
            value: faker.random.number({
                max: 1,
                min: 10000
            })
        }])

    }

}, 1500);

