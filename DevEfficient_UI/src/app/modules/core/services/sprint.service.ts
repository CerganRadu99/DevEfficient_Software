import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { Router } from "@angular/router";
import { Observable } from "rxjs";
import { CreateSprintModel } from "../../devboard/models/create-sprint.model";
import { ItemModel } from "../../devboard/models/item.model";
import { RegisteredSprintReturnModel } from "../../devboard/models/registered-sprint-return.model";
import { CreateItemModel } from "../../item/models/create-item.model";
import { ItemDetailsModel } from "../../item/models/item-details.model";
import { ResponseModel } from "../../shared/dtos/ResponseModel";
import { ResponseModelNonGeneric } from "../../shared/dtos/ResponseModelNonGeneric";
import { RetrievedCurrentSprintModel } from "../../sprint/models/retrieved-currentsprint.model";
import { DataService } from "./data.service";

@Injectable({providedIn: 'root'})
export class SprintService extends DataService {
  constructor(public http: HttpClient, private router: Router) {
    super(http, 'sprints');
  }

  public registerSprint(createSprintModel: CreateSprintModel): Observable<ResponseModel<RegisteredSprintReturnModel>> {
    const path = 'register';
    return super.post<ResponseModel<RegisteredSprintReturnModel>>(path, createSprintModel);
  }

  public activateSprint(createSprintModel: CreateSprintModel): Observable<ResponseModelNonGeneric> {
    const path = 'activate';
    return super.post<ResponseModelNonGeneric>(path, createSprintModel);
  }

  public getCurrentSprint(): Observable<ResponseModel<RetrievedCurrentSprintModel>> {
    return this.getOneByPath<ResponseModel<RetrievedCurrentSprintModel>>("currentSprint");
  }

  public closeCurrentSprint(): Observable<ResponseModelNonGeneric> {
    const path = "close/currentSprint";
    return this.updateWithoutBody<ResponseModelNonGeneric>(path);

  }

  public getCurrentSprintItems(): Observable<ResponseModel<Array<ItemModel>>> {
    const path = 'items';
    return this.getMany(path);
  }

  public deleteCurrentSprint(): Observable<ResponseModelNonGeneric> {
    const path = 'delete';
    return this.deleteWithoutId(path);
  }
}