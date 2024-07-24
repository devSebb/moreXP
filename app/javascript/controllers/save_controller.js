import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["svg"];

  async saveJob() {
    const svgElement = this.svgTarget;
    const pathElement = svgElement.querySelector("path");
    const jobId = svgElement.dataset.jobId;

    if (pathElement) {
      if (pathElement.getAttribute("fill") === "#1f2937") {
        pathElement.setAttribute("fill", "orange");

        await this.addJobToApplications(jobId);
      } else {
        pathElement.setAttribute("fill", "#1f2937");

        await this.removeJobFromApplications(jobId);
      }
    }
  }

  async addJobToApplications(jobId) {
    try {
      const response = await fetch(`/jobs/${jobId}/add_to_applications`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      });

      if (!response.ok) {
        throw new Error('Failed to add job to applications');
      }

      // Optionally handle success
    } catch (error) {
      console.error('Error adding job to applications:', error);
    }
  }

  async removeJobFromApplications(jobId) {
    try {
      const response = await fetch(`/jobs/${jobId}/remove_from_applications`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      });

      if (!response.ok) {
        throw new Error('Failed to remove job from applications');
      }
    } catch (error) {
      console.error('Error removing job from applications:', error);
    }
  }
}
