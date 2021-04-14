// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

setTimeout(async () => {
    let indice = 1;
    for (let i = 0; i < brands.length; i++) {
        for (let j = 0; j < brands[i].bModels.length; j++) {
            for (let k = 0; k < brands[i].bModels[j].models.length; k++) {
                await rest.executeQuery('insert into Models(name, brand_id) values(@name, @brand_id)', [{
                    name: 'name',
                    type: 'varchar',
                    value: brands[i].bModels[j].models[k]
                }, {
                    name: 'brand_id',
                    type: 'int',
                    value: indice
                }])

            }

            indice++;
        }
    }

}, 1500);

