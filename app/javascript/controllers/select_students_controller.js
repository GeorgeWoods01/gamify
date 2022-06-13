import { Controller } from "stimulus"

export default class extends Controller {
  // static targets = [ "output" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
  update() {
    const forms = document.querySelectorAll("form");
    console.log(forms)
    forms.forEach(form => form.submit())
  }
}
