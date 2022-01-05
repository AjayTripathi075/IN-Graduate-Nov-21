import { Component ,OnInit} from "@angular/core";
import { IUser } from '../user/Iuser';
import { UserService } from "../service/user.service";

@Component(
  {
    selector:'app-user-list',
    templateUrl:'./user-list.component.html',
    styleUrls:['./user-list.component.css']
  }
)
export class UserListComponent implements OnInit
{
  users:IUser[]=[];
  selectedUser?: IUser;
  constructor(private userService :UserService ) { }

  ngOnInit(): void {
    this.getUsers()
  }
 getUsers():void
 {
    this.userService.getUsers().subscribe(all_users=>this.users=all_users);
  }

  onSelect(user: IUser): void {
    this.selectedUser = user;
  }
}
