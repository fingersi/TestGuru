// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'core-js/stable' 
import 'regenerator-runtime/runtime'
import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


import 'jquery'
import 'popper.js'
import 'bootstrap'
import I18n from 'i18n-js'
window.I18n = I18n
import './sort_by_title.js'
import './check_password.js'
import './progress_bar.js'
import './validate_form.js'
import './form_short.js'
import './timer.js'
import '../stylesheets/application.scss'
import '../stylesheets/style.scss'



Rails.start()
Turbolinks.start()
ActiveStorage.start()
