const express = require('express');
const app = express();
const cors = require('cors');

// //cors 
 app.use(cors());

//setings
app.set('port', process.env.PORT || 3000); 
app.set('json spaces',2);
//mid
const morgan = require('morgan');
app.use(morgan('dev'));
app.use(express.urlencoded({extended: false}));
app.use(express.json());

//Manejador api restful
app.use(require('./routes/index'));


app.listen(app.get('port'), ()=>{
    console.log(`Corriendo en puerto ${app.get('port')}`);
});