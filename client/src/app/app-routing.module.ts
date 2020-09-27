import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import {ListaComponent} from './Components/lista/lista.component'
import {BodyComponent} from './Components/body/body.component'
const routes: Routes = [ 
  {
  path: '',
  redirectTo: '/menu',
  pathMatch: 'full'
},
{
  path: 'menu',
  component: ListaComponent 
},
{
  path: 'menu/pedido',
  component: BodyComponent
}
// ,{
//   path: 'subMenu',
//   redirectTo: '/subMenu',
//   pathMatch: 'full'
// },
// {
//   path:'subMenu',
//   component: SubmenuListComponent
// }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
