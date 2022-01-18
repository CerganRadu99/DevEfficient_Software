import { Component } from "@angular/core";
import { RouteDescriptor } from "../../models/route-descriptor";


@Component({
  selector: 'app-navigation',
  templateUrl: './navigation.component.html',
  styleUrls: ['./navigation.component.scss']
})
export class NavigationComponent {

  public navLinks: Array<RouteDescriptor> = []

  constructor() {
    this.navLinks = [
      {
        title: 'menu.links.home',
        path: '/'
      },
    ]
  }
}
