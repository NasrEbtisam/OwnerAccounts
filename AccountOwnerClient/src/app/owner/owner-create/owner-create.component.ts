import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { BsModalRef, BsModalService, ModalOptions } from 'ngx-bootstrap/modal';
import { OwnerRepositoryService } from '../../shared/services/owner-repository.service';
import { ErrorHandlerService } from '../../shared/services/error-handler.service';
import { Router } from '@angular/router';
import { DatePipe } from '@angular/common';
import { OwnerForCreation } from '../../_interfaces/OwnerForCreation.model';
import { Owner } from '../../_interfaces/owner.model';
import { SuccessModalComponent } from '../../shared/modals/success-modal/success-modal.component';
import { HttpErrorResponse } from '@angular/common/http';

@Component({
  selector: 'app-owner-create',
  templateUrl: './owner-create.component.html',
  styleUrl: './owner-create.component.css'
})
export class OwnerCreateComponent implements OnInit{
  /**
   *
   */
  errorMessage: string = '';
  ownerForm?: FormGroup;
  bsModalRef?: BsModalRef;
    constructor(private repository: OwnerRepositoryService, private errorHandler: ErrorHandlerService,
      private router: Router, private datePipe: DatePipe, private modal: BsModalService) {
    
  }
  ngOnInit(): void {
    this.ownerForm = new FormGroup({
      name: new FormControl('', [Validators.required, Validators.maxLength(60)]),
      dateOfBirth: new FormControl('', [Validators.required]),
      address: new FormControl('', [Validators.required, Validators.maxLength(100)])
    });
  }
  validateControl = (controlName: string) => {
    if (this.ownerForm?.get(controlName)!.invalid && this.ownerForm?.get(controlName)!.touched)
      return true;
    
    return false;
  } 
  
  hasError = (controlName: string, errorName: string) => {
    if (this.ownerForm?.get(controlName)!.hasError(errorName))
      return true;
    
    return false;
  }
  createOwner = (ownerFormValue: { name: any; dateOfBirth: string | number | Date; address: any; }) => {
    if (this.ownerForm?.valid)
      this.executeOwnerCreation(ownerFormValue);
  }
  private executeOwnerCreation = (ownerFormValue: { name: any; dateOfBirth: string | number | Date; address: any; }) => {
    const owner: OwnerForCreation = {
      name: ownerFormValue.name,
      dateOfBirth: this.datePipe.transform(ownerFormValue.dateOfBirth, 'yyyy-MM-dd')!,
      address: ownerFormValue.address
    }
    const apiUrl = 'api/owner';
    this.repository.createOwner(apiUrl, owner)
    .subscribe({
      next: (own: Owner) => {
        const config: ModalOptions = {
          initialState: {
            modalHeaderText: 'Success Message',
            modalBodyText: `Owner: ${own.name} created successfully`,
            okButtonText: 'OK'
          }
        };
  
        this.bsModalRef = this.modal.show(SuccessModalComponent, config);
        this.bsModalRef.content.redirectOnOk.subscribe((_: any) => this.redirectToOwnerList());
      },
      error: (err: HttpErrorResponse) => {
          this.errorHandler.handleError(err);
          this.errorMessage = this.errorHandler.errorMessage;
      }
    });
     
    }
    redirectToOwnerList = () => {
      this.router.navigate(['/owner/list']);
  }
}
