import { TableSorting } from "./table_sorting"
import { PasswordConfirmation } from "./password_confirmation"

document.addEventListener('turbolinks:load', function () {
    const sort_table = document.querySelector('#table-tests')
    const reg_form = document.querySelector('#reg_form')

    if (sort_table) new TableSorting(sort_table)

    if (reg_form) new PasswordConfirmation(reg_form)
})
