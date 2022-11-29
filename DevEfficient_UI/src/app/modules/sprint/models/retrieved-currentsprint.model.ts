import { CurrentSprintItemModel } from "./currentsprint-item.model";

export interface RetrievedCurrentSprintModel {
    title: string;
    goal: string;
    startDate: Date;
    endDate: Date;
    totalEstimatedHours: number;
    sprintItems: Array<CurrentSprintItemModel>;
}