const faker = require('faker');
const { graphicCard, panel, brands } = require('./computer');

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});


setTimeout(async () => {
    let marca = 1;
    let modelo = 1;

    for (let i = 0; i < brands.length; i++) {
        for (let j = 0; j < brands[i].bModels.length; j++) {
            for (let k = 0; k < brands[i].bModels[j].models.length; k++) {

                if (brands[i].typeBrand === 'pc') {

                    let resultado = await rest.executeQuery('insert into Items(id, brand_id, model_id, cpu_id, storage_id, screenPanel, graphicCard, serie) values(@id, @brand_id, @model_id, @cpu_id, @storage_id, @screenPanel, @graphicCard, @serie)', [{
                        name: 'id',
                        type: 'int',
                        value: modelo
                    }, {
                        name: 'brand_id',
                        type: 'int',
                        value: marca
                    },
                    {
                        name: 'model_id',
                        type: 'int',
                        value: modelo
                    }, {
                        name: 'cpu_id',
                        type: 'int',
                        value: faker.random.number({
                            min: 1,
                            max: 14
                        })
                    }, {
                        name: 'storage_id',
                        type: 'int',
                        value: faker.random.number({
                            min: 1,
                            max: 2
                        })
                    }, {
                        name: 'screenPanel',
                        type: 'varchar',
                        value: panel[faker.random.number({
                            min: 0,
                            max: panel.length - 1
                        })]
                    }, {
                        name: 'graphicCard',
                        type: 'varchar',
                        value: graphicCard[faker.random.number({
                            min: 0,
                            max: graphicCard.length - 1
                        })]

                    }, {
                        name: 'serie',
                        type: 'varchar',
                        value: faker.random.alphaNumeric(4)

                    }])

                    modelo++;
                    console.log(resultado);
                }
            }

            marca++;
        }
    }

}, 1500);

