export interface CreateSprintModel {
    title: string;
    goal: string;
    startDate: Date;
    endDate: Date;
    itemIds?: Array<string>;
}