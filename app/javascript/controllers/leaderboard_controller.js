import { Controller } from "@hotwired/stimulus"
import { ConfigList } from "@rails/webpacker/package/config_types"

export default class extends Controller {
  static targets = ['button', 'coins']
  add(event) {
    event.preventDefault
    const studentId = event.currentTarget.id
    this.coinsTargets.forEach(coin => {
      if (coin.id == studentId){
        const count = parseInt(coin.innerText, 10)
        coin.innerText = count + 1
      }
    });
  }
  subtract(event) {
    event.preventDefault
    const studentId = event.currentTarget.id
    this.coinsTargets.forEach(coin => {
      if (coin.id == studentId){
        const count = parseInt(coin.innerText, 10)
        coin.innerText = count - 1
      }
    });
  }
}
