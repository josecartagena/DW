import { Injectable } from '@angular/core';
import {HttpClient} from '@angular/common/http'; // para poder pedir datos

@Injectable({
  providedIn: 'root'
})
export class MenuService {

  API_URL = 'http://localhost:3000';

  constructor(private http: HttpClient ) {}


  getMenu(){
    return this.http.get(`${this.API_URL}/getMenu`);
  }
  
  getSubMenu(id: string){
    return this.http.get(`${this.API_URL}/getSubMenu?id=${id}`);

  }
// ******probando****
  getIngredientes(id: string){
    return this.http.get(`${this.API_URL}/getIngredientesRes?id=${id}`);

  }

// *******************************jose********************************
getProducto(id: string){
  return this.http.get(`${this.API_URL}/getIngredientes?id=${id}`);
}

}
