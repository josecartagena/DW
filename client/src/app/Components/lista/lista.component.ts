import { Component, HostBinding, OnInit } from '@angular/core';
import {MenuService} from '../../Services/menu.service';

@Component({
  selector: 'app-lista',
  templateUrl: './lista.component.html',
  styleUrls: ['./lista.component.css']
})
export class ListaComponent implements OnInit {
  @HostBinding('class') classes = 'row';
  
  show: boolean = true;
  menu1: any=[];
  menu2: any=[];
  ingrediente: any=[];

  constructor(private menuService: MenuService) { }
  
  ngOnInit(): void {
    
  this.getMenu();

  }
  getMenu() {
  this.menuService.getMenu().subscribe((res: any) => {
    this.menu1= res.Rows[0];
    //borrar console
    console.log(res.Rows[0])
  },
  err =>  console.error('error')
);
  }
  getSubMenu(id: string) {
      this.menuService.getSubMenu(id)
        .subscribe((res: any)=> {
          this.menu2= res.Rows[0];
          //borrar console
            console.log(res.Rows[0]);
            localStorage.setItem('Menu', id);


          },
          err => console.error(err)
        )
    }
    getProducto(id: string){

      localStorage.setItem('SubMenu', id);
    }

    // ****************************Pruebas**************************************
    getIngrediente(id: string) {
      this.menuService.getIngredientes(id)
        .subscribe((res: any)=> {
          this.ingrediente= res.Rows[0];
          //borrar console
            console.log(res.Rows[0]);
            // localStorage.setItem('Menu', id);


          },
          err => console.error(err)
        )
    }


  

    }

