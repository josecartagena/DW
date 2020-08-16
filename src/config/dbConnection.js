const mysql = require('mysql');


var mysqlConexion = mysql.createPool({
    connectionLimit: 150,
    host: 'localhost',
    user: 'root',
    password: 'root',
    database: 'DW',
    port: 8887,
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