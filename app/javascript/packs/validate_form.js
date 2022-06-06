addEventListener('turbolinks:load', function(){
  var data = document.getElementsByClassName('not_empty')

  if (data.length > 0){ 
    for (var i = 0; i < data.length; i++ ){
      data[i].dataset.id = i
      data[i].addEventListener('input', check_input )
    }
  }
})

function check_input(){
  var elements = document.getElementsByClassName('not_empty')
  for (var i = 0; i < elements.length; i++ ){
    if(isBlank(elements[i].value) === true ){
      var message = document.createElement('p')
      message.textContent = 'Un valid value.'
      message.classList.add('text-danger')
      message.setAttribute('id', 'form_massage')
      message.dataset.parent = elements[i].dataset.id
      elements[i].parentNode.appendChild(message)
      } else {
      var message = document.getElementById('form_massage')
      if(message != null && message.dataset.parent === elements[i].dataset.id){
        message.remove() 
      }
    }
  }
}

function isBlank(str) {
  return (!str || /^\s*$/.test(str));
}
