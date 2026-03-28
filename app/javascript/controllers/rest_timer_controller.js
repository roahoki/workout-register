import { Controller } from "@hotwired/stimulus"

// Countdown rest timer between sets.
// Usage: data-controller="rest-timer" data-rest-timer-seconds-value="90"
// Trigger: data-action="turbo:submit-end->rest-timer#start"
export default class extends Controller {
  static targets = ["display"]
  static values = { seconds: { type: Number, default: 90 } }

  connect() {
    this.remaining = 0
    this.timer = null
  }

  start(event) {
    // Only start if form submission succeeded (no validation errors)
    if (event?.detail?.success === false) return

    clearInterval(this.timer)
    this.remaining = this.secondsValue
    this.tick()
    this.timer = setInterval(() => this.tick(), 1000)
  }

  tick() {
    if (this.remaining <= 0) {
      clearInterval(this.timer)
      if (this.hasDisplayTarget) this.displayTarget.textContent = "Rest complete — go!"
      return
    }

    const mins = Math.floor(this.remaining / 60)
    const secs = String(this.remaining % 60).padStart(2, "0")
    if (this.hasDisplayTarget) {
      this.displayTarget.textContent = mins > 0
        ? `Rest: ${mins}:${secs}`
        : `Rest: ${secs}s`
    }
    this.remaining--
  }

  stop() {
    clearInterval(this.timer)
    if (this.hasDisplayTarget) this.displayTarget.textContent = ""
  }

  disconnect() {
    clearInterval(this.timer)
  }
}
