import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { MailRequest } from "../../mail-confirmation/models/mail-request.model";
import { ResponseModelNonGeneric } from "../../shared/dtos/ResponseModelNonGeneric";
import { DataService } from "./data.service";

@Injectable({providedIn: 'root'})
export class MailService extends DataService {
  constructor(public http: HttpClient, private router: Router) {
    super(http, 'email');
  }

  public sendEmail(mailRequest: MailRequest): Observable<ResponseModelNonGeneric> {
    const path = 'send';
    return super.post<ResponseModelNonGeneric>(path, mailRequest);
  }
}