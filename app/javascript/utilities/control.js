import { TableSorting } from "./table_sorting"
import { PasswordConfirmation } from "./password_confirmation"
import { FormInline } from "./form_inline"

document.addEventListener('turbolinks:load', function () {
    const sortTable = document.querySelector('#table-tests')
    const regForm = document.querySelector('#reg-form')
    const formsInline = document.querySelectorAll('.form-inline-link')

    if (sortTable) new TableSorting(sortTable)

    if (regForm) new PasswordConfirmation(regForm)

    if (formsInline) {
        for (let i = 0; i < formsInline.length; i++) {
            new FormInline(formsInline[i])
        }
    }
})
