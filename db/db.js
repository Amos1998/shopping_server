const mysql = require('mysql');
const connection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '123456',
    database: 'shopping_mall',
    multipleStatements: true
});

connection.connect();
module.exports = connection;