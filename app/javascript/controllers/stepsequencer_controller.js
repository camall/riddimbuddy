import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = [ "step", "stepcode" ]

    connect() {
        this.refreshCLasses()
    }

    stepButtonClick() {
        event.preventDefault()
        var index = parseInt(event.target.getAttribute("data-index"));

        this.stepTargets[index].value = this.stepTargets[index].value == '1' ? '0' : '1'
        var newStepcode = this.stepTargets.map((target) => {
            return target.value
        }).join('')
        this.stepcodeTarget.value = newStepcode
        this.refreshCLasses()
    }

    refreshCLasses() {
        this.stepTargets.forEach(function(target) {
            if (target.value == 1) { target.classList.add("purple") }
            else { target.classList.remove("purple") }
        })
    }
    
}