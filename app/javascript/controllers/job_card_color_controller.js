import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="job-card-color"
export default class extends Controller {
  static targets = ["jobCard"];

  connect() {
    this.changeCardColors();
  }

  changeCardColors() {
    this.jobCardTargets.forEach(card => {
      const industry = card.dataset.jobCardColor;
      card.classList.add(this.industryToColor(industry));
    });
  }

   industryToColor(industry) {
    const baseColor = {
      "Software Development": "yellow",
      "Finance & Accounting": "blue",
      "Architecture": "green",
      "Marketing & Graphic Design": "purple",
      "Photography": "orange",
      "Video & Film": "teal",
      "Fashion": "red"
    };

    const color = baseColor[industry] || "yellow";
    return `bg-${color}-100`;
  }
}
