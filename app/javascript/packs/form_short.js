addEventListener('turbolinks:load', function(){
  var links = document.getElementsByClassName('for_short_form')

  if (links.length > 0){ 
    for (var i = 0; i < links.length; i++ ){
      links[i].addEventListener('click', shortFormLinkHandler )
    }
  }
})

function shortFormLinkHandler(event){
  event.preventDefault()
  var testId = this.dataset.testId
  formHandler(testId)
}

function formHandler(testId){
  var link = document.querySelector('.for_short_form[data-test-id="' + testId + '"]')
  var title = document.querySelector('.test-title[data-test-id="' + testId + '"]')
  var form = document.querySelector('.form-short[data-test-id="' + testId + '"]')
  I18n.locale = language

  if (form.classList.contains('hide')){
    form.classList.remove('hide')
    title.classList.add('hide')
    link.text = I18n.t('cancel')
  } else {
    title.classList.remove('hide')
    form.classList.add('hide')
    link.text = I18n.t('edit')
  }
}