import { Component, EventEmitter, Input, input, OnInit, Output } from '@angular/core';
import { Account } from '../../../_interfaces/account.model';

@Component({
  selector: 'app-owner-accounts',
  templateUrl: './owner-accounts.component.html',
  styleUrl: './owner-accounts.component.css'
})
export class OwnerAccountsComponent implements OnInit{
  @Input() accounts: Account[] = [];
  @Output() onAccountClick: EventEmitter<Account> = new EventEmitter();
  constructor() { }
  ngOnInit(): void {
  }
  onAccountClicked = (account: Account) => {
    this.onAccountClick.emit(account);
  }
}
