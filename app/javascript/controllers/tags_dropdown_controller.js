import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="tags-dropdown"
export default class extends Controller {
  static targets = ["output", "dropdown", "hiddenField"]

  connect() {
    this.selectedTags = []
  }

  toggleDropdown() {
    this.dropdownTarget.classList.toggle("hidden")
  }

  updateSelection(event) {
    const tag = event.target.value
    if (event.target.checked) {
      this.selectedTags.push(tag)
    } else {
      this.selectedTags = this.selectedTags.filter(t => t !== tag)
    }
    this.updateOutput()
    this.updateHiddenField()
  }

  updateOutput() {
    if (this.selectedTags.length === 0) {
      this.outputTarget.textContent = "Select Tags"
    } else {
      this.outputTarget.textContent = this.selectedTags.join(", ")
    }
  }

  updateHiddenField() {
    this.hiddenFieldTarget.value = JSON.stringify(this.selectedTags)
  }
}
