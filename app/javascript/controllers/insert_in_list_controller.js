import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["form", "cardBottom", "description"]


  connect() {
    console.log(this.element)
    console.log(this.itemsTarget)
    console.log(this.formTarget)
    console.log("Hello, Stimulus!", this.element)
  }
  send(event) {
    event.preventDefault()
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {

        this.cardBottomTarget.innerHTML = data.form;
 //       this.formTarget.insertAdjacentHTML('afterbegin', data.mission)
        console.log(data)
      })
  }
  info(event) {
   this.descriptionTarget.classList.remove("d-none")
   this.formTarget.classList.add("d-none")
   this.iTarget.classList.add("d-none")
  }
}
