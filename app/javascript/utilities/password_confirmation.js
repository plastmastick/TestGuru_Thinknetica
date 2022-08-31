export class PasswordConfirmation {
    constructor(form) {
        this.form = form
        this.password = form.elements.user_password
        this.passwordConfirmation = form.elements.user_password_confirmation
        this.passwords = [this.password, this.passwordConfirmation]

        this._setup(this.password)
        this._setup(this.passwordConfirmation)
    }

    checkPasswordConfirm() {
        this.resetStyleForInputs()

        if (this.password.value !== this.passwordConfirmation.value) {
            // Passwords don't match
            for (let i = 0; i < this.passwords.length; i++) {
                this.passwords[i].parentElement.querySelector('.octicon-alert')
                    .classList.remove('hide')
                this.passwords[i].parentElement.classList.add('text-danger')
                this.passwords[i].parentElement.querySelector('input').classList.add('border-danger')
            }
        } else {
            // Passwords match
            for (let i = 0; i < this.passwords.length; i++) {
                this.passwords[i].parentElement.querySelector('.octicon-check-circle-fill')
                    .classList.remove('hide')
                this.passwords[i].parentElement.classList.add('text-success')
                this.passwords[i].parentElement.querySelector('input').classList.add('border-success')
            }
        }
    }

    resetStyleForInputs() {
        for (let i = 0; i < this.passwords.length; i++) {
            this.passwords[i].parentElement.classList.remove('text-danger')
            this.passwords[i].classList.remove('border-danger')
            this.passwords[i].parentElement.classList.remove('text-success')
            this.passwords[i].classList.remove('border-success')
            // hide octicons
            this.passwords[i].parentElement.querySelector('.octicon-alert').classList.add('hide')
            this.passwords[i].parentElement.querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
    }

    // private

    _setup(password_field) {
        password_field.addEventListener('input', event => {
            if (this.passwordConfirmation.value !== '') this.checkPasswordConfirm()
            else this.resetStyleForInputs()
        } )
    }
}
