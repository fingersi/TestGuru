document.addEventListener('turbolinks:load', function(){
  var pass_input = document.getElementById('password_field')
  var pass_confirmation = document.getElementById('password_confirmation')

  if (pass_input) { pass_input.addEventListener('input', check_password)}
  if (pass_confirmation) { pass_confirmation.addEventListener('input', check_password )}
})

function check_password(){
  var pswd_confirmation = document.getElementById('password_confirmation')
  var pswd_input = document.getElementById('password_field')
  var old_message = document.getElementById('pswd_message')
  if (old_message) {old_message.remove()}
  
  var message = document.createElement('p')
  message.setAttribute("id", "pswd_message")
  var container = document.getElementById('pass_message')
  var reg = new RegExp("(?=.*[A-Z])(?=.*[0-9])")
  if(!pswd_input.value){
    message.textContent = ''
  }else if (!reg.test(pswd_input.value)) {
    message.textContent = 'Password is weak'
    message.classList.add('text-danger')
  }else if (pswd_input.value != pswd_confirmation.value) {
    message.textContent = 'Passwords are not the same'
    message.classList.add('text-danger')
  } else {
    message.textContent = 'Password is ok'
    message.classList.add('text-success')
  }
  container.appendChild(message)
}


