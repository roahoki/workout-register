import { Controller } from "@hotwired/stimulus"

// Animates the workout progress bar when Turbo Stream updates the element.
// The bar width is set via inline style; this controller adds a pulse animation
// when progress reaches 100%.
export default class extends Controller {
  static targets = ["bar"]
  static values = { total: Number, logged: Number }

  connect() {
    this.update()
  }

  loggedValueChanged() {
    this.update()
  }

  update() {
    if (!this.hasBarTarget || this.totalValue === 0) return

    const pct = Math.min((this.loggedValue / this.totalValue) * 100, 100)
    this.barTarget.style.width = `${pct}%`

    if (pct >= 100) {
      this.barTarget.classList.add("animate-pulse")
    } else {
      this.barTarget.classList.remove("animate-pulse")
    }
  }
}
