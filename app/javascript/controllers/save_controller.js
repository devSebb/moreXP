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
        await this.addJobToBookmarks(jobId);
      } else {
        pathElement.setAttribute("fill", "#1f2937");
        await this.removeJobFromBookmarks(jobId);
      }
    }
  }

  async addJobToBookmarks(jobId) {
    try {
      const response = await fetch(`/bookmarks`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        },
        body: JSON.stringify({ job_id: jobId })
      });

      if (!response.ok) {
        throw new Error('Failed to add job to bookmarks');
      }

    } catch (error) {
      console.error('Error adding job to bookmarks:', error);
    }
  }

  async removeJobFromBookmarks(jobId) {
    try {
      const response = await fetch(`/bookmarks/${jobId}`, {
        method: "DELETE",
        headers: {
          "Content-Type": "application/json",
          "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').getAttribute('content')
        }
      });

      if (!response.ok) {
        throw new Error('Failed to remove job from bookmarks');
      }
    } catch (error) {
      console.error('Error removing job from bookmarks:', error);
    }
  }
}
