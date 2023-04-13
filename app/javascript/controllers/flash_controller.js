import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    setTimeout(() => {
      this.element.classList.add('fade-out');
      setTimeout(() => {
        this.element.remove();
      }, 1000);
    }, 4000);
  }

  remove() {
    this.element.remove();
  }
}
