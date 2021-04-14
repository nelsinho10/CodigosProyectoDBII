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
    for (let i = 0; i < nRegistros; i++) {

        let gender = (i % 2 === 0) ? 0 : 1;

        await rest.executeQuery('insert into Users(first_name, middle_name, last_name, second_last_name, email, password, phone) values(@first_name, @middle_name, @last_name, @second_last_name, @email, @password, @phone)', [{
            name: 'first_name',
            type: 'varchar',
            value: faker.name.firstName(gender)
        }, {
            name: 'middle_name',
            type: 'varchar',
            value: faker.name.firstName(gender)
        }, {
            name: 'last_name',
            type: 'varchar',
            value: faker.name.lastName(gender)
        }, {
            name: 'second_last_name',
            type: 'varchar',
            value: faker.name.lastName(gender)
        }, {
            name: 'email',
            type: 'varchar',
            value: faker.internet.email()
        }, {
            name: 'password',
            type: 'varchar',
            value: faker.internet.password()
        }, {
            name: 'phone',
            type: 'varchar',
            value: faker.phone.phoneNumber("####-####")
        }])

    }

}, 1500);