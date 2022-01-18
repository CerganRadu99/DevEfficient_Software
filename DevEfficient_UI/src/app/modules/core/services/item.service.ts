import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { ItemModel } from "../../devboard/models/item.model";
import { CreateItemModel } from "../../item/models/create-item.model";
import { ItemDetailsModel } from "../../item/models/item-details.model";
import { ResponseModel } from "../../shared/dtos/ResponseModel";
import { ResponseModelNonGeneric } from "../../shared/dtos/ResponseModelNonGeneric";
import { DataService } from "./data.service";

@Injectable({providedIn: 'root'})
export class ItemService extends DataService {
  constructor(public http: HttpClient, private router: Router) {
    super(http, 'items');
  }

  public getItems(): Observable<ResponseModel<Array<ItemModel>>> {
    return this.getAll<ResponseModel<Array<ItemModel>>>();
  }

  public getItem(itemId: string): Observable<ResponseModel<ItemDetailsModel>> {
    return this.getOneById<ResponseModel<ItemDetailsModel>>(itemId);
  }

  public updateItem(itemDetailsModel: ItemDetailsModel) {
    return this.update<ResponseModelNonGeneric>(itemDetailsModel.id, itemDetailsModel, "update")

  }

  public registerItem(createItemModel: CreateItemModel): Observable<ResponseModelNonGeneric> {
    const path = 'register';
    return super.post<ResponseModelNonGeneric>(path, createItemModel);
  }
}