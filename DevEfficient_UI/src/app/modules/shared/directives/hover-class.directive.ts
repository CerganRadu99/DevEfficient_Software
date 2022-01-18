import { Directive, ElementRef, HostListener, Input, Renderer2 } from '@angular/core';
@Directive({
  selector: '[hoverClass]'
})
export class HoverClassDirective {
  
  constructor(private elementRef: ElementRef, private renderer: Renderer2) { 
    this.setElevation(this.defaultElevation);
  }
  @Input() defaultElevation = 2;  
  @Input() raisedElevation = 8;

  @HostListener('mouseenter') onMouseEnter() {
    this.setElevation(this.raisedElevation);
 }

  @HostListener('mouseleave') onMouseLeave() {
    this.setElevation(this.defaultElevation);
  }

  setElevation(amount: number) {
    // remove all elevation classes
    const classesToRemove = Array.from((<HTMLElement>this.elementRef.nativeElement).classList).filter(c => c.startsWith('mat-elevation-z'));
    classesToRemove.forEach((c) => {
      this.renderer.removeClass(this.elementRef.nativeElement, c);
    });

    // add the given elevation class
    const newClass = `mat-elevation-z${amount}`;
    this.renderer.addClass(this.elementRef.nativeElement, newClass);
  }
}