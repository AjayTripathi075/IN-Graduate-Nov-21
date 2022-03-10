import { Component, OnInit } from '@angular/core';
import { PaymentDetailsService } from '../shared/payment-details.service';
import{PaymentDetails}from'../shared/payment-details.model';
import { NgForm } from '@angular/forms';
import { ToastrService } from 'ngx-toastr';
@Component({
  selector: 'app-payment-details',
  templateUrl: './payment-details.component.html',
  styleUrls: ['./payment-details.component.css']
})
export class PaymentDetailsComponent implements OnInit {

  constructor(public service: PaymentDetailsService,private toastr:ToastrService) { }

  ngOnInit(){
    this.service.refreshList();
  }
  populateForm(selectedRecord:PaymentDetails) {
    this.service.formData = Object.assign({}, selectedRecord);
  }
  onDelete(id: number) {
    if (confirm('Are you sure to delete this record ?')) {
      this.service.deletePaymentDetail(id)
        .subscribe(res => {
          this.service.refreshList();
          this.toastr.error("Deleted Successfully","Payment Details Register");
        },
        err => { console.log(err); })
    }
  }
}
