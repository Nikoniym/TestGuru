document.addEventListener('turbolinks:load', function () {
  var control = document.querySelector('.progress-bar')
  if (control) { setProgress(control) }
})

function setProgress(control) {
  var allProgress = control.dataset.questionsCount
  var currentProgress = control.dataset.questionPosition

  var percent = Math.round((currentProgress * 100) / allProgress) + '%'

  control.style.width = percent
  control.textContent = percent
}