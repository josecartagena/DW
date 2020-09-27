import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule } from '@angular/common/http'

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { ListaComponent } from './Components/lista/lista.component';
import{BodyComponent} from './Components/body/body.component'
import {HeaderComponent} from './Components/header/header.component'
import{MenuService} from './Services/menu.service';
import { SubmenuListComponent } from './components/submenu-list/submenu-list.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap'
@NgModule({
  declarations: [
    AppComponent,
    ListaComponent,
    SubmenuListComponent,
    BodyComponent,
    HeaderComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    HttpClientModule,
    NgbModule
  ],
  providers: [
    MenuService
  ],
  bootstrap: [AppComponent]
})
export class AppModule { }
