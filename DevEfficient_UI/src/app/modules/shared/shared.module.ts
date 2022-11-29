import { TranslateModule } from '@ngx-translate/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HoverClassDirective } from './directives/hover-class.directive';
import { PaginatorComponent } from './components/paginator/paginator.component';
import { MaterialModule } from 'src/material.module';
import { SidenavService } from './services/sidenav.service';
import { FlexLayoutModule } from '@angular/flex-layout';
import { RouterModule } from '@angular/router';
import {DragDropModule} from '@angular/cdk/drag-drop';
import { ToolTipRendererDirective } from './directives/tooltip-renderer-directive';
import { SidenavResponsiveComponent } from '../sidenav-menu/components/sidenav/sidenav-responsive.component';

@NgModule({
  declarations: [HoverClassDirective, ToolTipRendererDirective,  PaginatorComponent, SidenavResponsiveComponent],
  imports: [CommonModule, FormsModule, ReactiveFormsModule, TranslateModule, MaterialModule, FlexLayoutModule, RouterModule, DragDropModule],
  exports: [CommonModule, FormsModule, ReactiveFormsModule, TranslateModule, HoverClassDirective, ToolTipRendererDirective, PaginatorComponent, MaterialModule, SidenavResponsiveComponent, FlexLayoutModule, DragDropModule],
  providers: [SidenavService]
})
export class SharedModule { }