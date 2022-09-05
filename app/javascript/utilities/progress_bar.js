export class ProgressBar {
    constructor(progressBar) {
        this.progressBar = progressBar
        this.currentProgressPercent = this._currentProgressSet()

        this.progressValueUpdate()
    }

    progressValueUpdate() {
        this.progressBar.style.width = this.currentProgressPercent + '%'
        this.progressBar.textContent = this.currentProgressPercent + '%'
    }

    _currentProgressSet() {
        const currentQuestionIndex = document.querySelector('form').dataset.questionIndex
        const questionsCount = document.querySelector('form').dataset.questionsCount
        const progress = currentQuestionIndex / questionsCount * 100
        return Math.round(progress)
    }
}
