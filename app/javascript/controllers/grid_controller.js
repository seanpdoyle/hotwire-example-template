import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "column", "row" ]
  static values = { column: Number, row: Number }

  columnTargetConnected(target) {
    if (target.hasAttribute("tabindex")) return

    const row = this.rowTargets.findIndex(row => row.contains(target))
    const column = this.columnTargets.indexOf(target)
    const tabindex = row == this.rowValue && column == this.columnValue ?
       0 :
      -1

    target.setAttribute("tabindex", tabindex)
  }

  captureFocus({ target }) {
    for (const column of this.columnTargets) {
      const tabindex = column == target ?
         0 :
        -1

      column.setAttribute("tabindex", tabindex)
    }
  }

  moveColumn({ key, params: { directions } }) {
    if (key in directions) {
      this.columnValue += directions[key]

      const row = this.rowTargets[this.rowValue]
      const columnsInRow = this.columnTargets.filter(column => row.contains(column))
      const nextColumn = columnsInRow[this.columnValue]

      if (nextColumn) nextColumn.focus()
    }
  }

  moveRow({ key, params: { directions } }) {
    if (key in directions) {
      this.rowValue += directions[key]

      const row = this.rowTargets[this.rowValue]
      const columnsInRow = this.columnTargets.filter(column => row.contains(column))
      const nextColumn = columnsInRow[this.columnValue]

      if (nextColumn) nextColumn.focus()
    }
  }
}
