export class TestTimer {
    constructor(testTimer) {
        this.testTimer = testTimer
        this.sendAnswerButton = document.querySelector('#send-answer')

        this._setup()
    }

    timerUpdate(htmlObject) {
        let min
        let sec
        [min, sec] = htmlObject.testTimer.innerText.split(":")

        if (sec <= 0 && min <= 0) {
            htmlObject.sendAnswerButton.click()
            return
        }

        if (sec === '0' || sec === '00') {
            min--
            sec = 59
            min = String(min)
        } else {
            sec--
        }

        if (min.length < 2) min = "0" + min
        if (sec < 10) sec = "0" + sec

        htmlObject.testTimer.innerText = min + ":" + sec
        setTimeout(function () {
            htmlObject.timerUpdate(htmlObject)
        }, 1000)
    }

    _setup() {
        const htmlObject = this

        this.timerUpdate(htmlObject)
    }
}
