import { Controller } from "@hotwired/stimulus"
import Tone from 'tone'

export default class extends Controller {
    static targets = [ "bpm" ]

    connect() {
        
    }

    createSamplePlayer(url) {
        return new Tone.Player(url).toDestination();
    }

    playTonePlayer(tonePlayer) {
        Tone.loaded().then(() => {
            tonePlayer.start();
        });
    }

    async play() {
        var stepSequencers = JSON.parse(this.data.get("step-sequencers"))
        var createSamplePlayer = this.createSamplePlayer
        var playTonePlayer = this.playTonePlayer
        await Tone.start()
        
        this.loops = stepSequencers.map(function(stepSequencer) {
            return stepSequencer.stepcode.split('').map(function(stepcode, index) {
                var loop = new Tone.Loop(time => {
                    playTonePlayer(createSamplePlayer(stepSequencer.sampleUrl))
                }, '2n')
                loop.interval = "2n";
                if (stepcode == '1') { 
                    Tone.Transport.schedule(time => {
                        loop.start() 
                    }, index+"n");
                }
                return loop
            })
        }).flat(1)
        Tone.Transport.bpm.value = this.bpmTarget.value
        Tone.Transport.start()
    }

    stop() {
        this.loops.forEach(function(loop) {
            loop.stop();
        })
    }
}