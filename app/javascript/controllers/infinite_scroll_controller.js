import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.loading = false
    this.checkScroll = this.checkScroll.bind(this)

    window.addEventListener("scroll", this.checkScroll)
  }

  checkScroll() {
    if (this.loading) return

    if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 300) {

      const button = document.querySelector("#load-more a")

      if (button) {
        this.loading = true

        document.querySelector("#loader")?.classList.remove("hidden")

        button.click()
      }
    }
  }

  disconnect() {
    window.removeEventListener("scroll", this.checkScroll)
  }
}
