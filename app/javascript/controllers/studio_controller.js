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

        // const synthA = new Tone.FMSynth().toDestination();
        const bartime = Tone.Time("8n").toSeconds();

        this.loops = stepSequencers.map(function(stepSequencer) {
            return stepSequencer.stepcode.split('').map(function(stepcode, index) {
                var loop = new Tone.Loop(time => {
                    playTonePlayer(createSamplePlayer(stepSequencer.sampleUrl))
                    // synthA.triggerAttackRelease("C2", "16n", time);
                }, bartime*8)
                if (stepcode == '1') {
                    loop.start(bartime*index)
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