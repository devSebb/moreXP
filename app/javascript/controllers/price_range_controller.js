import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-range"
export default class extends Controller {
  static targets = [ "slider", "display", "form" ]
  static values = { min: Number, max: Number }

  connect() {
    this.updateDisplay()
  }

  updateDisplay() {
    const value = this.sliderTarget.value
    this.displayTarget.textContent = value == this.maxValue ? "Any" : `$${value}`
  }

  submit() {
    this.formTarget.requestSubmit()
  }
}
