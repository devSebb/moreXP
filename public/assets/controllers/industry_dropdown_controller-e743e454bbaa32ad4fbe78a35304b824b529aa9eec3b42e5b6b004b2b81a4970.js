// app/javascript/controllers/industry_dropdown_controller.js
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["selected", "output"]

  selectItem(event) {
    event.preventDefault()
    const selectedValue = event.target.getAttribute('data-value')
    this.selectedTarget.textContent = selectedValue
    this.outputTarget.textContent = selectedValue
    this.outputTarget.value = selectedValue
    const hiddenField = document.getElementById('industry-hidden-field');
    hiddenField.value = selectedValue;

    const dropdownMenu = this.element.querySelector('[data-industry-dropdown-target="selected"]');
    dropdownMenu.classList.add('hidden');
  }
};
