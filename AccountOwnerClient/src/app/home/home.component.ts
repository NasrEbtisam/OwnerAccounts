import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css'
})
export class HomeComponent implements OnInit{

  public homeText: string;
  constructor() { 
    this.homeText = "WELCOME TO ACCOUNT-OWNER APPLICATION";
  }
  ngOnInit(): void {
    
  }
}
