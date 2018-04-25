document.addEventListener('turbolinks:load', function () {
  var password = document.querySelector('#user_password')
  var password_confirm = document.querySelector('#user_password_confirmation')

  if (password) { password.addEventListener('keyup', checkPassword) }
  if (password_confirm) { password_confirm.addEventListener('keyup', checkPassword) }
})

function checkPassword() {
  var password_confirm = document.querySelector('#user_password_confirmation')
  var password = document.querySelector('#user_password')
  var check = document.querySelector('.octicon-check')
  var error = document.querySelector('.octicon-circle-slash')

  if (password_confirm.value) {
    if (password.value == password_confirm.value) {
      check.classList.remove('hide')
      error.classList.add('hide')
    } else {
      check.classList.add('hide')
      error.classList.remove('hide')
    }
  } else {
    check.classList.add('hide')
    error.classList.add('hide')
  }
}
