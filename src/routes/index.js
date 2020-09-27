const { Router } = require('express');
var conexion = require('../config/dbConnection');

const router = Router();

router.get('/getIngredientesRest', (req, res) => {
    var parametros = req.query;
    conexion.getConnection((err, con) => {
        con.query('CALL PRC_INGREDIENTES_REST(?)', parametros.id, (err, rows, fields) => {
            if (!err) {
                const data = {
                    "Estatus": true,
                    "Descripcion": "Lista de ingredientes para agregar a un producto",
                    "Rows": rows
                }
                res.header("Access-Control-Allow-Origin", "*");
                res.header("Access-Control-Allow-Headers", "Origin, X-Requested-With, Content-Type, Accept");
                res.json(data);
            } else {
                const data = {
                    "Estatus": false,
                    "Descripcion": "Error: " + err,
                }

                res.json(data);
            }
            con.release();
        });
    });
    //conexion.release();
});

router.get('/getMenu',(req, res)=>{
    conexion.getConnection( (err, con)=>{
        con.query('CALL PRC_MENU()', (err, rows)=>{
            if(err){
                const data = {
                    "Estatus" : false,
                    "Descripcion": "Error: "+err,
                }
                res.json(data);
            }else{
                const data = {
                    "Estatus" : true,
                    "Descripcion": "Menu de la plataforma",
                    "Rows": rows
                }
                res.json(data);
            }
            con.release();
        });
    });
});


router.get('/getIngredientes',(req, res)=>{
    var parametros = req.query;
    conexion.getConnection( (err, con) => {
        con.query('CALL PRC_LIST_INGREDIENTES(?)', parametros.id , (err, rows, fields) => {
            if(!err){
                const data = {
                    "Estatus" : true,
                    "Descripcion": "Lista de ingredientes de un producto especificado",
                    "Rows": rows
                }
                res.json(data);
            }else{
                const data = {
                    "Estatus" : false,
                    "Descripcion": "Error: "+err,
                }
                res.json(data);
            }
            con.release();
        });
    });
    //conexion.release();
});


router.get('/getSubMenu',(req, res)=>{
    var parametros = req.query;
    conexion.getConnection( (err, con) => {
        con.query('CALL PRC_SUB_MENU(?);', parametros.id , (err, rows, fields) => {
            if(!err){
                const data = {
                    "Estatus" : true,
                    "Descripcion": "Lista de productos de un menu especificado",
                    "Rows": rows
                }
                res.json(data);
            }else{
                const data = {
                    "Estatus" : false,
                    "Descripcion": "Error: "+err,
                }
                res.json(data);
            }
            con.release();
        });
    });
});

router.post('/CreateCustomer',(req, res)=>{
    var parametros = req.body;
    conexion.getConnection( (err, con) => {
        con.query('CALL PRC_CREATE_CLI(?,?,?,?,?);', [parametros.nombre, parametros.nit, parametros.correo, parametros.password, parametros.direccion], (err, rows, fields) => {
            if(!err){
                const data = {
                    "Estatus" : true,
                    "Descripcion": "El cliente "+parametros.nombre +" fue agregado satisfactoriamente",
                    "Data": rows
                }
                res.json(data);
            }else{
                const data = {
                    "Estatus" : false,
                    "Descripcion": "Error: "+err,
                }
                res.json(data);
            }
            con.release();
        });
    });
});

module.exports = router;