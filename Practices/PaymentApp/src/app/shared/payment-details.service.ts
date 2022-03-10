import { PaymentDetails } from './payment-details.model';
import { Injectable } from '@angular/core';
import { HttpClient } from "@angular/common/http";

@Injectable({
  providedIn: 'root'
})
export class PaymentDetailsService {
  formData: PaymentDetails= new PaymentDetails();
  readonly baseURL = 'http://localhost:5622/api/PaymentDetails';
  list : PaymentDetails[];

  constructor(private http: HttpClient) { }

  postPaymentDetail() {
    return this.http.post(this.baseURL, this.formData);
  }
  putPaymentDetail() {
    return this.http.put(`${this.baseURL}/${this.formData.paymentDetailId}`, this.formData);
  }
  deletePaymentDetail(id: number) {
    return this.http.delete(`${this.baseURL}/${id}`);
  }

  refreshList() {
    this.http.get(this.baseURL)
      .toPromise()
      .then(res =>this.list = res as PaymentDetails[]);
  }
}
