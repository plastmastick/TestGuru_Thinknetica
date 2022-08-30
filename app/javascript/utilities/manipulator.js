document.addEventListener('turbolinks:load', function () {
    class Manipulator {
        constructor(htmlElement) {
            this.htmlElement = htmlElement
            if (htmlElement.classList.contains('sort-by-title')) {
                htmlElement.addEventListener('click', this.sortRowsByTitle)
            } else if (htmlElement.classList.contains('password-check')) {
                htmlElement.addEventListener('input', this.checkPasswordConfirm)
            }
        }

        sortRowsByTitle = () => {
            let tbody = document.querySelector('tbody')
            let rows = tbody.querySelectorAll('tr')
            let sortedRows = []

            // select all tbody rows
            for (let i = 0; i < rows.length; i++) {
                sortedRows.push(rows[i])
            }

            // sort row by td#title
            if (this.htmlElement.querySelector('.octicon-arrow-up').classList.contains('hide')) {
                sortedRows.sort(this._compareRowsAsc)
                this.htmlElement.querySelector('.octicon-arrow-up').classList.remove('hide')
                this.htmlElement.querySelector('.octicon-arrow-down').classList.add('hide')
            } else {
                sortedRows.sort(this._compareRowsDesc)
                this.htmlElement.querySelector('.octicon-arrow-down').classList.remove('hide')
                this.htmlElement.querySelector('.octicon-arrow-up').classList.add('hide')
            }

            // update rows id's td#row-number
            this._rowsNumberUpdate(sortedRows)

            let sortedTbody = document.createElement('tbody')

            sortedTbody.classList.add('table')

            for (let i = 0; i < sortedRows.length; i++) {
                sortedTbody.appendChild(sortedRows[i])
            }

            tbody.parentNode.replaceChild(sortedTbody, tbody)
        }

        checkPasswordConfirm = () => {
            let checkFields = document.querySelectorAll('.password-check')
            let password = document.querySelector('input#user_password')
            let passwordConfirmation = document.querySelector('input#user_password_confirmation')

            if (password.value !== passwordConfirmation.value && passwordConfirmation.value) {
                // Passwords do not match
                for (let i = 0; i < checkFields.length; i++) {
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
                for (let i = 0; i < checkFields.length; i++) {
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
                for (let i = 0; i < checkFields.length; i++) {
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

        // private

        _compareRowsAsc(row1, row2) {
            let testTitle1 = row1.querySelector('td#title').textContent
            let testTitle2 = row2.querySelector('td#title').textContent

            if (testTitle1 < testTitle2) { return -1 }
            if (testTitle1 > testTitle2) { return 1 }
            return 0
        }

        _compareRowsDesc(row1, row2) {
            let testTitle1 = row1.querySelector('td#title').textContent
            let testTitle2 = row2.querySelector('td#title').textContent

            if (testTitle1 > testTitle2) { return -1 }
            if (testTitle1 < testTitle2) { return 1 }
            return 0
        }

        _rowsNumberUpdate(rows) {
            for (let i = 0; i < rows.length; i++) {
                rows[i].querySelector('td#row-number').textContent = i + 1
            }
        }
    }

    // search selectors and create manipulator objects
    let control = document.querySelectorAll('.password-check, .sort-by-title')

    if (control) {
        for (let i = 0; i < control.length; i++) {
            new Manipulator(control[i])
        }
    }
})
