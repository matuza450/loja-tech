import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  switchImage(event) {
    // Update main image
    const mainImage = document.getElementById('main-product-image')
    mainImage.src = event.currentTarget.dataset.imageUrl
    
    // Update active state of thumbnails
    document.querySelectorAll('.product-thumbnail').forEach(thumb => {
      thumb.classList.remove('active')
    })
    event.currentTarget.classList.add('active')
  }
}