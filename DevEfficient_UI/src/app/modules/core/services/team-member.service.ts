import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { ItemModel } from "../../devboard/models/item.model";
import { AddMemberModel } from "../../management/models/add-member-model";
import { CreateMemberModel } from "../../management/models/create-member.model";
import { RetrievedMemberModel } from "../../management/models/retrieved-member.model";
import { ResponseModel } from "../../shared/dtos/ResponseModel";
import { ResponseModelNonGeneric } from "../../shared/dtos/ResponseModelNonGeneric";
import { DataService } from "./data.service";

@Injectable({providedIn: 'root'})
export class TeamMemberService extends DataService {
  constructor(public http: HttpClient, private router: Router) {
    super(http, 'teammembers');
  }

  public getMembers(): Observable<ResponseModel<Array<RetrievedMemberModel>>> {
    return this.getAll<ResponseModel<Array<RetrievedMemberModel>>>();
  }

  public registerMember(createMemberModel: AddMemberModel): Observable<ResponseModelNonGeneric> {
    const path = 'register';
    return super.post<ResponseModelNonGeneric>(path, createMemberModel);
  }
}