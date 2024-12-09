import { Controller } from "@hotwired/stimulus";
import { enter, leave } from "el-transition";

// Connects to data-controller="drawer"
export default class extends Controller {
  static targets = ["backdrop", "panel"];

  #isEntering;
  #isLeaving;

  backdropTargetConnected(target) {
    if (this.#isEntering) enter(target);
  }

  panelTargetConnected(target) {
    if (this.#isEntering) enter(target);
  }

  async animate(event) {
    const {
      detail: { newFrame },
    } = event;

    const currentChildCount = this.element.children.length;
    const newChildCount = newFrame.children.length;

    this.#isEntering = currentChildCount == 0 && newChildCount > 0;
    this.#isLeaving = currentChildCount > 0 && newChildCount == 0;

    if (this.#isLeaving) {
      event.preventDefault();

      await Promise.all([
        leave(this.backdropTarget).then(() => this.backdropTarget.remove()),
        leave(this.panelTarget).then(() => this.panelTarget.remove()),
      ]);

      event.detail.resume();
    }
  }
}
