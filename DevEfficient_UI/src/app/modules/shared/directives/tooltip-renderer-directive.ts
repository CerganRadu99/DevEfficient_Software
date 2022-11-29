import { Overlay, OverlayPositionBuilder, OverlayRef } from "@angular/cdk/overlay";
import { ComponentPortal } from "@angular/cdk/portal";
import { ComponentRef, Directive, ElementRef, HostListener, Input, TemplateRef } from "@angular/core";
import { RemainingDaysTooltip } from "../../sprint/components/remaining-days-tooltip/remaining-days-tooltip.component";

@Directive({
    selector: '[customToolTip]'
  })
  export class ToolTipRendererDirective {
  
    @Input() showToolTip: boolean = true;
  
    @Input() startDate!: string;
    @Input() endDate!: string;
  
    @Input() contentTemplate!: TemplateRef<any>;
  
    private _overlayRef!: OverlayRef;
    constructor(private _overlay: Overlay,
                private _overlayPositionBuilder: OverlayPositionBuilder,
                private _elementRef: ElementRef) { }

    ngOnInit() {
  
      if (!this.showToolTip) {
        return;
      }
      const positionStrategy = this._overlayPositionBuilder
                                   .flexibleConnectedTo(this._elementRef)
                                   .withPositions([{
                                                      originX: 'center',
                                                      originY: 'bottom',
                                                      overlayX: 'center',
                                                      overlayY: 'top',
                                                      offsetY: 5,
                                                  }]);
  
      this._overlayRef = this._overlay.create({ positionStrategy});
  
    }

    @HostListener('mouseenter')
    show() {
  
      if (this._overlayRef && !this._overlayRef.hasAttached()) {
        const tooltipRef: ComponentRef<RemainingDaysTooltip> = this._overlayRef.attach(new ComponentPortal(RemainingDaysTooltip));
        tooltipRef.instance.startDate = this.startDate;
        tooltipRef.instance.endDate = this.endDate;
        tooltipRef.instance.contentTemplate = this.contentTemplate;
      }    
    }
  
    @HostListener('mouseleave')
    hide() {
      this.closeToolTip();
    }
  
    ngOnDestroy() {
      this.closeToolTip();
    }
  
    private closeToolTip() {
      if (this._overlayRef) {
        this._overlayRef.detach();
      }
    }
  
  }