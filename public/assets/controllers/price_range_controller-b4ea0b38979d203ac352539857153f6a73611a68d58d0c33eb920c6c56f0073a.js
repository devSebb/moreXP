import{Controller}from"@hotwired/stimulus";export default class extends Controller{static targets=["slider","display","form"];static values={min:Number,max:Number};connect(){this.updateDisplay()}updateDisplay(){const t=this.sliderTarget.value;this.displayTarget.textContent=t==this.maxValue?"Any":`$${t}`}submit(){this.formTarget.requestSubmit()}}