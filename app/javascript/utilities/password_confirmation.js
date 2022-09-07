export class PasswordConfirmation {
    constructor(form) {
        this.form = form
        this.passwordDiv = form.querySelector('.password')
        this.passwordConfirmationDiv = form.querySelector('.password-confirmation')
        this.passwordDiv.password = form.elements.user_password
        this.passwordConfirmationDiv.password = form.elements.user_password_confirmation
        this.passwordsDiv = [this.passwordDiv, this.passwordConfirmationDiv]

        this._setup(this.passwordDiv.password)
        this._setup(this.passwordConfirmationDiv.password)
    }

    checkPasswordConfirm() {
        this.resetStyleForInputs()

        if (this.passwordDiv.password.value !== this.passwordConfirmationDiv.password.value) {
            // Passwords don't match
            for (let i = 0; i < this.passwordsDiv.length; i++) {
                this.passwordsDiv[i].querySelector('.octicon-alert')
                    .classList.remove('hide')
                this.passwordsDiv[i].classList.add('text-danger')
                this.passwordsDiv[i].password.classList.add('border-danger')
            }
        } else {
            // Passwords match
            for (let i = 0; i < this.passwordsDiv.length; i++) {
                this.passwordsDiv[i].querySelector('.octicon-check-circle-fill')
                    .classList.remove('hide')
                this.passwordsDiv[i].classList.add('text-success')
                this.passwordsDiv[i].password.classList.add('border-success')
            }
        }
    }

    resetStyleForInputs() {
        for (let i = 0; i < this.passwordsDiv.length; i++) {
            this.passwordsDiv[i].classList.remove('text-danger')
            this.passwordsDiv[i].password.classList.remove('border-danger')
            this.passwordsDiv[i].classList.remove('text-success')
            this.passwordsDiv[i].password.classList.remove('border-success')
            // hide octicons
            this.passwordsDiv[i].querySelector('.octicon-alert').classList.add('hide')
            this.passwordsDiv[i].querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
    }

    // private

    _setup(passwordField) {
        passwordField.addEventListener('input', event => {
            if (this.passwordConfirmationDiv.password.value !== '') this.checkPasswordConfirm()
            else this.resetStyleForInputs()
        } )
    }
}
