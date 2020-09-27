import { Component, OnInit } from '@angular/core';
import {MenuService} from '../../Services/menu.service';

@Component({
  selector: 'app-submenu-list',
  templateUrl: './submenu-list.component.html',
  styleUrls: ['./submenu-list.component.css']
})
export class SubmenuListComponent implements OnInit {
  menu2: any=[]
  constructor(private menuService: MenuService) { }

  ngOnInit(): void {
  }
  // getSubMenu() {
  //   this.menuService.getMenu().subscribe((res: any) => {
  //     this.menu1= res.Rows[0];
  //     console.log(res.Rows[0])
  //   },
  // getSubMenu(id: string) {
  //   this.menuService.getSubMenu(id)
  //     .subscribe((res: any)=> {
  //       this.menu2= res.Rows[0];
  //         console.log(res.Rows[0]);
          
  //       },
  //       err => console.error(err)
  //     )
  // }
}



