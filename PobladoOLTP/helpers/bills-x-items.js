const faker = require("faker");

// Configuraciones de la DB
const rest = new (require('rest-mssql-nodejs'))({
    user: 'usuario1',
    password: '1234',
    server: 'localhost',
    database: 'BI'
});


setTimeout(async () => {
    let billItemId = 15461;
    let randNum;

    // for de bills
    for (let billId = 10001; billId <= 10312; billId++) {

        randNum = 2;
        if (billId == 10312) {
            randNum = 3;
        }
        
        for (; randNum > 0; randNum--) {

            console.log(`bills_id: ${billId}`, `bills_items_id: ${billItemId}`);
            let resultado = await rest.executeQuery('INSERT INTO billsItem_x_bills (bills_id, bills_item_id) VALUES (@bills_id, @bills_item_id);', [
                {
                    name: 'bills_id',
                    type: 'int',
                    value: billId
                }, {
                    name: 'bills_item_id',
                    type: 'int',
                    value: billItemId
                }]);

            console.log(resultado);
            billItemId++;
        }

    }
}, 1500);