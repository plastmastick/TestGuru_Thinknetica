document.addEventListener('turbolinks:load', function () {
    // NodeList
    // https://developer.mozilla.org/ru/docs/Web/API/NodeList
    var control = document.querySelectorAll('.password-check')

    if (control) {
        for (var i = 0; i < control.length; i++) {
            control[i].addEventListener('input', checkPasswordConfirm)
        }
    }
})

function checkPasswordConfirm() {
    var checkFields = document.querySelectorAll('.password-check')
    var password = document.querySelector('input#user_password')
    var passwordConfirmation = document.querySelector('input#user_password_confirmation')

    if (password.value !== passwordConfirmation.value && passwordConfirmation.value) {
        // Passwords do not match
        for (var i = 0; i < checkFields.length; i++) {
            // remove class
            checkFields[i].querySelector('.octicon-alert').classList.remove('hide')
            checkFields[i].classList.remove('text-success')
            checkFields[i].querySelector('input').classList.remove('border-success')
            // add class
            checkFields[i].classList.add('text-danger')
            checkFields[i].querySelector('input').classList.add('border-danger')
            checkFields[i].querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
    } else if (password.value === passwordConfirmation.value && passwordConfirmation.value) {
        // Passwords match
        for (var i = 0; i < checkFields.length; i++) {
            // remove class
            checkFields[i].classList.remove('text-danger')
            checkFields[i].querySelector('input').classList.remove('border-danger')
            checkFields[i].querySelector('.octicon-check-circle-fill').classList.remove('hide')
            // add class
            checkFields[i].classList.add('text-success')
            checkFields[i].querySelector('input').classList.add('border-success')
            checkFields[i].querySelector('.octicon-alert').classList.add('hide')
        }
    } else {
        // native style
        for (var i = 0; i < checkFields.length; i++) {
            // remove class
            checkFields[i].classList.remove('text-danger')
            checkFields[i].querySelector('input').classList.remove('border-danger')
            checkFields[i].classList.remove('text-success')
            checkFields[i].querySelector('input').classList.remove('border-success')
            // add class
            checkFields[i].querySelector('.octicon-alert').classList.add('hide')
            checkFields[i].querySelector('.octicon-check-circle-fill').classList.add('hide')
        }
    }
}
