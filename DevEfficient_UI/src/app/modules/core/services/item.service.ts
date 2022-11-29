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
import { ResponseModel } from "../../shared/dtos/ResponseModel";
import { ResponseModelNonGeneric } from "../../shared/dtos/ResponseModelNonGeneric";
import { DataService } from "./data.service";

@Injectable({providedIn: 'root'})
export class ItemService extends DataService {
  constructor(public http: HttpClient, private router: Router) {
    super(http, 'items');
  }

  public getItems(searchItemsModel: SearchItemsModel): Observable<ResponseModel<Array<ItemModel>>> {
    const path = "";
    return super.post<ResponseModel<Array<ItemModel>>>(path, searchItemsModel);
  }

  public getItem(itemId: string): Observable<ResponseModel<ItemDetailsModel>> {
    return this.getOneById<ResponseModel<ItemDetailsModel>>(itemId);
  }

  public updateItem(itemDetailsModel: ItemDetailsModel) {
    return this.update<ResponseModelNonGeneric>(itemDetailsModel.id, itemDetailsModel, "update")
  }

  public updateStateOfItem(itemId: string, newState: string): Observable<ResponseModelNonGeneric> {
    const path = "updateState/" + itemId;
    return this.update<ResponseModelNonGeneric>(path, {state: newState});
  }

  public setSprintOfItem(itemId: string): Observable<ResponseModelNonGeneric> {
    const path = "setSprint/" + itemId;
    return this.updateWithoutBody<ResponseModelNonGeneric>(path);
  }

  public clearSprintOfItem(itemId: string): Observable<ResponseModelNonGeneric> {
    const path = "clearSprint/" + itemId;
    return this.updateWithoutBody<ResponseModelNonGeneric>(path);
  }

  public registerItem(createItemModel: CreateItemModel): Observable<ResponseModel<RegisteredItemReturnModel>> {
    const path = 'register';
    return super.post<ResponseModel<RegisteredItemReturnModel>>(path, createItemModel);
  }

  public orderItemsTopBottomDevboard(orderItemsDevboard: OrderItemsDevboard): Observable<ResponseModel<Array<string>>> {
    const path = 'topBottomDevboard';
    return super.post<ResponseModel<Array<string>>>(path, orderItemsDevboard);
  }

  public changeItemsOrder(itemsOrderObject: any): Observable<ResponseModelNonGeneric> {
    const path = "itemsOrder";
    return super.post<ResponseModelNonGeneric>(path, itemsOrderObject);
  }

  public deleteItem(itemId: string): Observable<ResponseModelNonGeneric> {
    const path = 'delete';
    return this.delete(itemId, path);
  }
}