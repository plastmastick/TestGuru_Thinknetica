export class TableSorting {
    constructor(table) {
        this.table = table
        this.sorting_cell = table.querySelector('.sort-by-title')

        this._setup()
    }

    sortRowsByTitle() {
        const tBody = this.table.tBodies[0]
        const rows =  tBody.querySelectorAll('tr')
        let sortedRows = []

        // select all rows
        for (let i = 0; i < rows.length; i++) {
            sortedRows.push(rows[i])
        }

        // sort row by td#title
        if (this.sorting_cell.querySelector('.octicon-arrow-up').classList.contains('hide')) {
            sortedRows.sort(this._compareRowsAsc)
            this.sorting_cell.querySelector('.octicon-arrow-up').classList.remove('hide')
            this.sorting_cell.querySelector('.octicon-arrow-down').classList.add('hide')
        } else {
            sortedRows.sort(this._compareRowsDesc)
            this.sorting_cell.querySelector('.octicon-arrow-down').classList.remove('hide')
            this.sorting_cell.querySelector('.octicon-arrow-up').classList.add('hide')
        }

        // update rows id's td#row-number
        this._rowsNumberUpdate(sortedRows)

        let sortedTbody = document.createElement('tbody')

        for (let i = 0; i < sortedRows.length; i++) {
            sortedTbody.appendChild(sortedRows[i])
        }

        this.table.replaceChild(sortedTbody,  tBody)
    }

    // private

    _compareRowsAsc(row1, row2) {
        const testTitle1 = row1.querySelector('td#title').textContent
        const testTitle2 = row2.querySelector('td#title').textContent

        if (testTitle1 < testTitle2) {
            return -1
        }
        if (testTitle1 > testTitle2) {
            return 1
        }
        return 0
    }

    _compareRowsDesc(row1, row2) {
        const testTitle1 = row1.querySelector('td#title').textContent
        const testTitle2 = row2.querySelector('td#title').textContent

        if (testTitle1 > testTitle2) {
            return -1
        }
        if (testTitle1 < testTitle2) {
            return 1
        }
        return 0
    }

    _rowsNumberUpdate(rows) {
        for (let i = 0; i < rows.length; i++) {
            rows[i].querySelector('td#row-number').textContent = i + 1
        }
    }

    _setup() {
        this.sorting_cell.addEventListener('click', event => this.sortRowsByTitle() )
    }
}
