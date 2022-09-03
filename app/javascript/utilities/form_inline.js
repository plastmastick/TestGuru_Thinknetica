export class FormInline {
    constructor(formInlineLink) {
        this.formInlineLink = formInlineLink

        this._setup()
    }

    formInlineLinkHandler(event) {
        event.preventDefault()

        const testId = this.formInlineLink.dataset.testId

        this.formInlineHandler(testId)
    }

    formInlineHandler(testId) {
        const link = document.querySelector('.form-inline-link[data-test-id="' + testId + '"]')
        const testTitle = document.querySelector('.test-title[data-test-id="' + testId + '"]')
        const formInline = document.querySelector('.form-inline[data-test-id="' + testId + '"]')

        if(formInline.classList.contains(('hide'))) {
            testTitle.classList.add('hide')
            formInline.classList.remove('hide')
            link.value = I18n.t('helpers.buttons.cancel')
        } else {
            testTitle.classList.remove('hide')
            formInline.classList.add('hide')
            link.value = I18n.t('helpers.buttons.edit')
        }
    }

    _setup() {
        const errors = document.querySelector('.resource-errors')

        if (errors) {
            const resourceId = errors.dataset.resourceId
            this.formInlineHandler(resourceId)
        }

        this.formInlineLink.addEventListener('click', event => this.formInlineLinkHandler(event) )
    }
}
