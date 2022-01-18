import { TranslateModule } from '@ngx-translate/core';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { HoverClassDirective } from './directives/hover-class.directive';
import { PaginatorComponent } from './components/paginator/paginator.component';
import { MaterialModule } from 'src/material.module';
import { SidenavResponsiveComponent } from './components/sidenav/sidenav-responsive.component';
import { SidenavService } from './services/sidenav.service';
import { FlexLayoutModule } from '@angular/flex-layout';
import { RouterModule } from '@angular/router';
import {DragDropModule} from '@angular/cdk/drag-drop';

@NgModule({
  declarations: [HoverClassDirective, PaginatorComponent, SidenavResponsiveComponent],
  imports: [CommonModule, FormsModule, ReactiveFormsModule, TranslateModule, MaterialModule, FlexLayoutModule, RouterModule, DragDropModule],
  exports: [CommonModule, FormsModule, ReactiveFormsModule, TranslateModule, HoverClassDirective, PaginatorComponent, MaterialModule, SidenavResponsiveComponent, FlexLayoutModule, DragDropModule],
  providers: [SidenavService]
})
export class SharedModule { }