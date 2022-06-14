import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "checkbox" ]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }
  change(event) {
    // const forms = document.querySelectorAll("form");
    console.log("Im HERE!!")
    // forms.forEach(form => form.submit())
    const missionId = event.currentTarget.dataset.setup
    const checked = `<label id = "check" data-change-checkbox-target="box" data-action="click->change-checkbox#change" for="mission_setups_${missionId}_completion" data-setup="${missionId}">
    <img src="/assets/100_icons/little/8_ok-845088c204eaaabec571732824a4cdfa258361757bd129461b7355a593c18c7c.png">
</label>`

    const uncheck = `<label id = "uncheck" data-change-checkbox-target="box" data-action="click->change-checkbox#change" id="check" for="mission_setups_${missionId}_completion" data-setup="${missionId}">
<img src="/assets/100_icons/little/4_close-acedf937679dc0f4d1277d03a17d6ef1817e934f7aeb7ef8cff89220230426ef.png">
</label>`

    const target_id = event.currentTarget.id
    if (target_id == "check") {
      event.currentTarget.outerHTML = uncheck
    } else {
      event.currentTarget.outerHTML = checked
    }

    const checkbox = document.getElementById(missionId)
    if (checkbox.checked == true) {
      checkbox.checked = false
    } else {
      checkbox.checked = true
    }

  }
}
