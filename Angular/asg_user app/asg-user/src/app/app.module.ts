import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { FormsModule } from '@angular/forms';
import {MatInputModule} from '@angular/material/input';
import{MatCardModule} from '@angular/material/card'
import {MatToolbarModule} from '@angular/material/toolbar';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { UserListComponent } from './user-list/user-list.component';
import { HeaderComponent } from './header/header.component';
import {UserComponent} from './user/user.component';
import { FooterComponent } from './footer/footer.component';
import {HttpClientModule} from '@angular/common/http'
import {UserService} from './service/user.service'
@NgModule({
  declarations: [
    AppComponent,
    UserListComponent,
    HeaderComponent,
    UserComponent,
    FooterComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    BrowserAnimationsModule,
    MatInputModule,
    MatToolbarModule,
    MatCardModule,
    HttpClientModule
  ],
  providers: [UserService],
  bootstrap: [AppComponent]
})
export class AppModule { }
