addEventListener('turbolinks:load', function(){
  var data = document.getElementsByClassName('not_empty')

  if (data.length > 0){ 
    for (var i = 0; i < data.length; i++ ){
      data[i].dataset.id = i
      data[i].addEventListener('input', check_input )
    }
  }
})

function check_input (e){
  if(isBlank(e.srcElement.value)){
    if(canAddErrorMessage(e.srcElement)){
      var message = document.createElement('p')
      message.textContent = I18n.t('un_valid')
      message.classList.add('text-danger')
      message.classList.add('for_warning_message')
      message.classList.add('form_massage')
      message.setAttribute('id', e.srcElement.dataset.id)
      message.dataset.parent = e.srcElement.dataset.id
      e.srcElement.parentNode.appendChild(message)
    }
  } else {
    var messages = document.getElementsByClassName('for_warning_message')
      for (var i = 0; i < messages.length; i++){
      if(e.srcElement.dataset.id === messages[i].id){
        messages[i].remove() 
        hideButtons(false)
      }
    }
  }
}

function canAddErrorMessage(element){
  var messages = document.getElementsByClassName('form_massage')
  for (var i = 0; i < messages.length; i++){
    if(element.id === messages[i]) {
      return false
    }
  }
  return true
}

function isBlank(str) {
  return (!str || /^\s*$/.test(str));
}

function hideButtons(status){
  var buttons = document.getElementsByClassName('btn')
  for (var i = 0; i < buttons.length; i++){
    buttons[i].disabled = status 
  }
}

