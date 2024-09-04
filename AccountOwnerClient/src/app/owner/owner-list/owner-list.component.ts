import { Component } from '@angular/core';
import { Owner } from '../../_interfaces/owner.model';
import { OwnerRepositoryService } from '../../shared/services/owner-repository.service';
import { ErrorHandlerService } from '../../shared/services/error-handler.service';
import { HttpErrorResponse, HttpResponse } from '@angular/common/http';
import { Router } from '@angular/router';

@Component({
  selector: 'app-owner-list',
  templateUrl: './owner-list.component.html',
  styleUrl: './owner-list.component.css'
})
export class OwnerListComponent {
  owners: Owner[] = [];
  errorMessage: string = '';
  constructor(private repository: OwnerRepositoryService,private errorHandler: ErrorHandlerService,
    private router: Router
  ) { }
  ngOnInit(): void {
    this.getAllOwners();
  }
  private getAllOwners = () => {
    const apiAddress: string = 'api/owner';
    this.repository.getOwners(apiAddress)
    .subscribe({
      next: (own: Owner[]) => this.owners = own,
      error: (err: HttpErrorResponse) => {
          this.errorHandler.handleError(err);
          this.errorMessage = this.errorHandler.errorMessage;
      }
    })
  }
  
  public getOwnerDetails = (id: any) => { 
    const detailsUrl: string = `/owner/details/${id}`; 
    this.router.navigate([detailsUrl]); 
  }
  public redirectToUpdatePage = (id: any) => { 
    const updateUrl: string = `/owner/update/${id}`; 
    this.router.navigate([updateUrl]); 
  }
  public redirectToDeletePage = (id: any) => { 
    const deleteUrl: string = `/owner/delete/${id}`; 
    this.router.navigate([deleteUrl]); 
  }
}
