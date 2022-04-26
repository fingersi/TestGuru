document.addEventListener('turbolinks:load', function(){
  var control = document.querySelector('.sort-by-title')
  if (control) { control.addEventListener('click', sortTableByTitle) }
})

function sortTableByTitle (){
  var table = document.querySelector('table')
  var rows = table.querySelectorAll('tr')
  var resultRows = []

  for (var i = 1; i < rows.length; i++){
    resultRows.push(rows[i])
  }

  if (this.querySelector('.arrow-up').classList.contains('hide')){
    resultRows.sort(compareRowsUp)
    this.querySelector('.arrow-up').classList.remove('hide')
    this.querySelector('.arrow-down').classList.add('hide')
  } else {
    resultRows.sort(compareRowsDown)
    this.querySelector('.arrow-down').classList.remove('hide')
    this.querySelector('.arrow-up').classList.add('hide')
  }
  
  var sortedTable = document.createElement('table')
  var titleBody = document.createElement('tbody')
  titleBody.appendChild(rows[0])
  sortedTable.appendChild(titleBody)
  var tBody = document.createElement('tbody')
  for (var i = 0; i < resultRows.length; i++){
    tBody.appendChild(resultRows[i])
  }
  sortedTable.appendChild(tBody)
  sortedTable.classList.add('table')
  sortedTable.classList.add('table-borderless')
  table.parentNode.replaceChildren(sortedTable, table)
  table.remove()
  
}

function compareRowsUp (row1, row2) {
  var title1 = row1.querySelector('td').textContent
  var title2 = row2.querySelector('td').textContent

  if (title1 > title2) {return 1}
  if (title1 < title2) {return -1}
  return 0
}

function compareRowsDown (row1, row2) {
  var title1 = row1.querySelector('td').textContent
  var title2 = row2.querySelector('td').textContent

  if (title1 > title2) {return -1}
  if (title1 < title2) {return 1}
  return 0
}