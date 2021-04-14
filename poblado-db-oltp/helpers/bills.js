// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});

const fechaInicio = new Date('2021-02-14');
const fechaFin = new Date('2021-03-19');

let numDias = 1;

while (fechaFin.getTime() >= fechaInicio.getTime()) {
    fechaInicio.setDate(fechaInicio.getDate() + 1);
    // console.log(numDias);
    numDias++;
}

const fechaInicio2 = new Date('2021-02-14');
const fechaFin2 = new Date('2021-03-19');

let tiempo = 1500 / numDias;
let facturasDias = Math.round(tiempo);
let arrFechas = []
// console.log(numDias, facturasDias);

for (let i = 1; i <= numDias; i++) {
    for (let j = 1; j <= faker.random.number({ max: facturasDias + 3, min: facturasDias -1 }); j++) {
        if (fechaFin2.getTime() >= fechaInicio2.getTime()) {
            let fecha = ` ${fechaInicio2.getFullYear()}-${(fechaInicio2.getMonth() + 1)}-${fechaInicio2.getDate()}`
            arrFechas.push(fecha);
            // console.log(i, fecha);
        }

    }
    fechaInicio2.setDate(fechaInicio2.getDate() + 1);
}

let contador = 1;
setTimeout(async () => {

    for (let k = 10134; k < arrFechas.length + 10134; k++) {
        if (k <= 10312 ) {
            
            let test = `${k}`.padStart(8, 0);
            let invoice = `001-001-01-${test}`;

            // console.log( k, arrFechas[k]);
            let direccionUser = faker.random.number({ max: 5000, min: 1 });
            let idUser = await (await rest.executeQuery(`SELECT user_id FROM Addresses WHERE id = ${direccionUser}`)).data[0][0].user_id;
            // console.log(k, arrFechas[contador] ,direccionUser, idUser, invoice);
            contador ++;
            let resultado = await rest.executeQuery('insert into Bills(date, total, invoice_number, bill_config_id, user_id, address_id, exempted, exonerated,id ) values( @date, @total, @invoice_number, @bill_config_id, @user_id, @address_id, @exempted, @exonerated,@id )', [
                {
                    name: 'date',
                    type: 'date',
                    value: arrFechas[contador]
                }, {
                    name: 'total',
                    type: 'money',
                    value: 0
                }, {
                    name: 'invoice_number',
                    type: 'varchar',
                    value: invoice
                }, {
                    name: 'bill_config_id',
                    type: 'int',
                    value: 7
                }, {
                    name: 'user_id',
                    type: 'int',
                    value: idUser
                }, {
                    name: 'address_id',
                    type: 'int',
                    value: direccionUser
                }, {
                    name: 'exempted',
                    type: 'money',
                    value: 0

                }, {
                    name: 'exonerated',
                    type: 'money',
                    value: 0
                    
                },{
                    name: 'id',
                    type: 'int',
                    value: k
                    
                }]);

            console.log(resultado);
        }
    }
}, 1500);

