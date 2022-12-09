import { Component, Input, TemplateRef } from "@angular/core";

@Component({
 selector: 'app-custom-tool-tip',
 templateUrl: './remaining-days-tooltip.component.html',
 styleUrls: ['./remaining-days-tooltip.component.scss']
})
export class RemainingDaysTooltip {

 @Input() startDate!: string;
 @Input() endDate!: string;

 @Input() contentTemplate!: TemplateRef<any>;

 constructor() { }

} 