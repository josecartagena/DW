
import { Component } from '@angular/core';
import {ConsumirWs} from './body.services';
import { NgbModalConfig, NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
    selector:'app-body',
    templateUrl: './body.component.html'
})

export class BodyComponent{
    mostrar = true;
    ext= false;
    responseIngredientes: any;
    responseIngredientesRest : any;
    nombreProducto:string;
    descripcion:string;
    precio:string;
    urlIngredinentes     = 'http://localhost:3000/';
    urlIngredinentesRest = 'http://localhost:3000/';
    idProducto:any;
    idIngrediente:any;
    idExtra: any;
    imagen: any;
    nombreExtra:any;
    costo:number = 0;

    pedidoR = [];
    // 'http://127.0.0.1:3000/getIngredientes?id=1';
    constructor(public json:ConsumirWs){        
    }
    
    ngOnInit() {
        this.idProducto = localStorage.getItem('SubMenu');

        this.urlIngredinentes = this.urlIngredinentes+'getIngredientes?id='+this.idProducto;

        this.json.getJSON(this.urlIngredinentes).subscribe((res: any)=>{
            //console.log(res.Rows[0]);
            this.responseIngredientes       = res.Rows[0];
            //console.log(this.responseIngredientes.length);
            this.nombreProducto             = this.responseIngredientes[0].NOMBRE_PRODUCTO;
            this.descripcion                = this.responseIngredientes[0].DESCRIPCION;
            this.precio                     = this.responseIngredientes[0].PRECIO;
            this.imagen                     = this.responseIngredientes[0].IMAGEN;
            this.costo = this.responseIngredientes[0].PRECIO;
        });

        this.urlIngredinentesRest = this.urlIngredinentesRest+'getIngredientesRest?id='+this.idProducto;

        this.json.getJSON(this.urlIngredinentesRest).subscribe((res: any)=>{
            //console.log(res.Rows[0]);
            this.responseIngredientesRest       = res.Rows[0];
            
        });
        
    };

    private modalService: NgbModal

    open(content) {
        this.modalService.open(content);
      }
    //alertify = require('alertifyjs');

    SavePeido(idOrden){
        localStorage.setItem(idOrden,this.responseIngredientes);
        console.log(localStorage);
        alert('Pedido completado');
        localStorage.clear;
        location.href ="http://localhost:4200/";
    }

    getProducto(idIngrediente){
        this.responseIngredientes.push(idIngrediente);
        //110+50
        this.costo = idIngrediente.COSTO+this.costo;
        /*localStorage.setItem('Ingrediente-'+idIngrediente.ID_INGREDIENTE, JSON.stringify(idIngrediente));
        console.log(idIngrediente);
        this.idExtra = JSON.parse(localStorage.getItem("Ingrediente"))
        this.nombreExtra= this.nombreExtra+'\n'+'<li>'+this.idExtra.NOMBRE_INGREDIENTE+'</li>';
        this.costo= this.idExtra.COSTO;*/
        //console.log('Local s '+JSON.parse(localStorage));
    }

    setProducto(keey, data){
        this.idExtra = JSON.parse(localStorage.getItem("Ingrediente"))
        this.nombreExtra= this.idExtra.NOMBRE_INGREDIENTE;
        this.costo= this.idExtra.COSTO;
        //localStorage.setItem('Ingrediente', JSON.stringify(idIngrediente));
    }
    
    
}