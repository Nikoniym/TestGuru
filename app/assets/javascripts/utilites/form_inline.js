document.addEventListener('turbolinks:load', function () {
  var controls = document.querySelectorAll('.form-inline-link')
  if (controls.length) {
    for (var i = 0; i < controls.length; i++) {
      controls[i].addEventListener('click', formInlineLinkHendler)
    }
  }

  var errors = document.querySelector('.resource-errors')

  if (errors) {
    var resourceId = errors.dataset.resourceId
    formInlineHendler(resourceId)
  }
})

function formInlineLinkHendler(event) {
  event.preventDefault()
  var testId = this.dataset.testId
  formInlineHendler(testId)
}

function formInlineHendler(testId) {
  var link = document.querySelector('.form-inline-link[data-test-id="'+ testId +'"]')
  var testTitle =  document.querySelector('.test-title[data-test-id="'+ testId +'"]')
  var formInline =  document.querySelector('.form-inline[data-test-id="'+ testId +'"]')
  if (link && testTitle && formInline) {
    if (formInline.classList.contains('hide')) {
      testTitle.classList.add('hide')
      formInline.classList.remove('hide')
      link.textContent = 'Cancel'
    } else {
      testTitle.classList.remove('hide')
      formInline.classList.add('hide')
      link.textContent = 'edit'
    }
  }
}