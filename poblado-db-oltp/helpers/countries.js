// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

setTimeout(async () => {

    let indice = 0;

    for (let i = 0; i < Regions.length; i++) {
        for (let j = 0; j < Regions[i].paises.length; j++) {

            indice++;

            await rest.executeQuery('insert into Countries(id,name,region_id) values(@id,@name,@region_id)', [{
                name: 'id',
                type: 'int',
                value: indice
            }, {
                name: 'name',
                type: 'varchar',
                value: Regions[i].paises[j]
            }, {
                name: 'region_id',
                type: 'int',
                value: i + 1
            }])
        }
    }

}, 1500);
