import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { ItemModel } from "../../devboard/models/item.model";
import { OrderItemsDevboard } from "../../devboard/models/order-items-devboard.model";
import { SearchItemsModel } from "../../devboard/models/search-items.model";
import { CreateItemModel } from "../../item/models/create-item.model";
import { ItemDetailsModel } from "../../item/models/item-details.model";
import { RegisteredItemReturnModel } from "../../item/models/registered-item-return.model";
import { MailRequest } from "../../mail-confirmation/models/mail-request.model";
import { ResponseModel } from "../../shared/dtos/ResponseModel";
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