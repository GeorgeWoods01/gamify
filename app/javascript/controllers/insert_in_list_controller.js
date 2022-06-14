import { Controller } from "@hotwired/stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["form", "cardBottom", "description","countdown", "exit"]
  static values = {time: Number}
  connect() {
    // console.log(this.element)
    // console.log(this.itemsTarget)
    // console.log(this.formTarget)
    // console.log("Hello, Stimulus!", this.element)
    //console.log(this.timeValue)
  }

  send(event) {
    event.preventDefault()
    const time = event.currentTarget.dataset.time
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.formTarget)
    })
      .then(response => response.json())
      .then((data) => {

        this.cardBottomTarget.innerHTML = data.form;
 //       this.formTarget.insertAdjacentHTML('afterbegin', data.mission)
        this.simpleCountdown(this.countdownTarget, time)
      })
  }

  info(event) {
   this.descriptionTarget.classList.remove("d-none")
   this.formTarget.classList.add("d-none")
   this.exitTarget.classList.toggle("d-none")
  }

  simpleCountdown(target = this.countdownTarget,time){
    // Set the date we're counting down to
  const countDownDate = new Date("Jan 5, 2024 15:00:00").getTime();
  //const countDownDate = new Date().getTime() + mission.length
// Update the count down every 1 second
  const x = setInterval(function() {

  // Get today's date and time
  const now = new Date().getTime();

  // Find the distance between now and the count down date
  const distance = countDownDate - now;

  // Time calculations for days, hours, minutes and seconds
  //const days = Math.floor(distance / (1000 * 60 * 60 * 24));
  //const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60)//);
  const minutes = parseInt(time) - 1
  const seconds = Math.floor((distance % (1000 * 60)) / 1000);
  //  console.log(target)
  // Display the result in the element with id="demo"
  target.innerText = minutes + "m " + seconds + "s ";

  // If the count down is finished, write some text
  if (distance < 0) {
    clearInterval(x);
    target.innerHTML = "Time's up!";
  }
}, 1000);
  }
}
