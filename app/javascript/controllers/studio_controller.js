import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    const minute = 60000
    const steps = 8
    var bpm = 120
    var beat = (minute/bpm)*steps
    var stepcodes = JSON.parse(this.data.get("stepcodes"));
    var audios = JSON.parse(this.data.get("urls"))
    var audios = audios.map(ss => new Audio(ss));
    stepcodes.forEach(function(stepcode, stepindex) {
        console.log('nesto')
        stepcode.split('').forEach(function(char, index) {
        if (char == 1)
        {
        setTimeout(() => {
            setInterval(function(){ audios[stepindex].play(); }, beat);
        }, (index+1)*(beat/8));
        }
    });
    });
  }
}



    // var play = document.getElementById("play");
  
    // play.addEventListener("click", play_studio);
