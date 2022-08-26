document.addEventListener('turbolinks:load', function () {
    var control = document.querySelector('.sort-by-title')

    if (control) { control.addEventListener('click', sortRowsByTitle) }
})

function sortRowsByTitle() {
    var tbody = document.querySelector('tbody')

    // NodeList
    // https://developer.mozilla.org/ru/docs/Web/API/NodeList
    var rows = tbody.querySelectorAll('tr')
    var sortedRows = []

    // select all tbody rows
    for (var i = 0; i < rows.length; i++) {
        sortedRows.push(rows[i])
    }

    // sort row by td#title
    if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
        sortedRows.sort(compareRowsAsc)
        this.querySelector('.octicon-arrow-up').classList.remove('hide')
        this.querySelector('.octicon-arrow-down').classList.add('hide')
    } else {
        sortedRows.sort(compareRowsDesc)
        this.querySelector('.octicon-arrow-down').classList.remove('hide')
        this.querySelector('.octicon-arrow-up').classList.add('hide')
    }

    // update rows id's td#row-number
    rowsNumberUpdate(sortedRows)

    var sortedTbody = document.createElement('tbody')

    sortedTbody.classList.add('table')

    for (var i = 0; i < sortedRows.length; i++) {
        sortedTbody.appendChild(sortedRows[i])
    }

    tbody.parentNode.replaceChild(sortedTbody, tbody)
}

function compareRowsAsc(row1, row2) {
    var testTitle1 = row1.querySelector('td#title').textContent
    var testTitle2 = row2.querySelector('td#title').textContent

    if (testTitle1 < testTitle2) { return -1 }
    if (testTitle1 > testTitle2) { return 1 }
    return 0
}

function compareRowsDesc(row1, row2) {
    var testTitle1 = row1.querySelector('td#title').textContent
    var testTitle2 = row2.querySelector('td#title').textContent

    if (testTitle1 > testTitle2) { return -1 }
    if (testTitle1 < testTitle2) { return 1 }
    return 0
}

function rowsNumberUpdate(rows) {
    for (var i = 0; i < rows.length; i++) {
        rows[i].querySelector('td#row-number').textContent = i + 1
    }
}
