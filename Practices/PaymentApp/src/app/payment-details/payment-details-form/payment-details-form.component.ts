import { Component, OnInit } from '@angular/core';
import { PaymentDetailsService } from 'src/app/shared/payment-details.service';
import{PaymentDetails}from 'src/app/shared/payment-details.model';
import { NgForm } from '@angular/forms';
import {ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-payment-details-form',
  templateUrl: './payment-details-form.component.html',
  styleUrls: ['./payment-details-form.component.css']
})
export class PaymentDetailsFormComponent implements OnInit {

  constructor(public service:PaymentDetailsService,private toaster:ToastrService) { }

  ngOnInit(): void {
  }
  resetForm(form: NgForm) {
    form.form.reset();
    this.service.formData = new PaymentDetails();
  }
  onSubmit(form: NgForm) {
    if (this.service.formData.paymentDetailId == 0)
      this.insertRecord(form);
    else
      this.updateRecord(form);
  }

  updateRecord(form: NgForm) {
    this.service.putPaymentDetail().subscribe(
      res => {
        this.resetForm(form);
        this.service.refreshList();
        this.toaster.info('Submit successfully',"Payment Details Register");
      },
      err => {
        console.log(err);
      }
    )
  }

  insertRecord(form: NgForm) {
    this.service.postPaymentDetail().subscribe(
      res => {
        this.resetForm(form);
        this.service.refreshList();
        this.toaster.success('Submit successfully',"Payment Details Register");
      },
      err => { console.log(err); }
    )
  }
}
