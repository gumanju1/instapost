import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  connect() {
    window.addEventListener("scroll", this.loadMore.bind(this))
  }

  loadMore() {
    if (window.innerHeight + window.scrollY >= document.body.offsetHeight - 200) {

      const button = document.querySelector("#load-more a")

      if (button) {
        button.click()
      }

    }
  }

}
