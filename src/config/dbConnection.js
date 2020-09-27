const mysql = require('mysql');


var mysqlConexion = mysql.createPool({
    connectionLimit: 150,
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'dw',
    port: 3306,
    timeout: 10
});


mysqlConexion.getConnection( function (err, connection) {
    if(err){
        console.log('Error al conectarse a la base de datos '+err);
    }else{
        console.log('Conexion satisfactoria ');
    }
});

module.exports = mysqlConexion;