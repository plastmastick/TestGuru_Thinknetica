import { TableSorting } from "./table_sorting"
import { PasswordConfirmation } from "./password_confirmation"
import { FormInline } from "./form_inline.js.erb"
import { ProgressBar } from "./progress_bar"
import { TestTimer} from './test_timer.js.erb'

document.addEventListener('turbolinks:load', function () {
    const sortTable = document.querySelector('#table-tests')
    const regForm = document.querySelector('#reg-form')
    const formsInline = document.querySelectorAll('.form-inline-link')
    const progressBar = document.querySelector('.test-progress-bar')
    const testTimer = document.querySelector('.test-timer')

    if (sortTable) new TableSorting(sortTable)

    if (regForm) new PasswordConfirmation(regForm)

    if (formsInline) {
        for (let i = 0; i < formsInline.length; i++) {
            new FormInline(formsInline[i])
        }
    }

    if (progressBar) new ProgressBar(progressBar)

    if (testTimer) new TestTimer(testTimer)
})
