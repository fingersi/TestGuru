I18n.translations || (I18n.translations = {});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), JSON.parse('{"activerecord":{"attributes":{"answer":{"correct":"Correct","value":"Answer"},"question":{"body":"Question"},"test":{"author_id":"Author","level":"Level","title":"Title"},"user":{"admin":"Admin","confirmation_sent_at":"Confirmation sent at","confirmation_token":"Confirmation token","confirmed_at":"Confirmed at","created_at":"Created at","current_password":"Current password","current_sign_in_at":"Current sign in at","current_sign_in_ip":"Current sign in IP","email":"Email","encrypted_password":"Encrypted password","failed_attempts":"Failed attempts","first_name":"First name","last_name":"Last Name","last_sign_in_at":"Last sign in at","last_sign_in_ip":"Last sign in IP","locked_at":"Locked at","login":"Login","password":"Password","password_confirmation":"Password confirmation","remember_created_at":"Remember created at","remember_me":"Remember me","reset_password_sent_at":"Reset password sent at","reset_password_token":"Reset password token","sign_in_count":"Sign in count","unconfirmed_email":"Unconfirmed email","unlock_token":"Unlock token","updated_at":"Updated at"}},"errors":{"messages":{"record_invalid":"Validation failed: %{errors}","restrict_dependent_destroy":{"has_many":"Cannot delete record because dependent %{record} exist","has_one":"Cannot delete record because a dependent %{record} exists"}}},"models":{"user":{"one":"User","other":"Users"}}},"admin":{"answers":{"answer":{"are_you_sure":"Are you sure?"}},"badges":{"create":{"cannot_save_badge":"Бадже не сохранился. Проверьте параметры"},"edit":{"title":"Название"},"form":{"activated":"Activated","category":"Category","create":"Create","first_time":"at the first time","image":"Image","level":"Level","title":"Название"},"index":{"badges":"Badges","condition":"Condiction","new_badge":"Create new badge","picture":"picture path","title":"Title"},"new":{"title":"Badges"},"show":{"title":"Badges"}},"gists":{"index":{"gist_hash":"Gist","question":"Question","title":"All created gists.","user":"User"}},"questions":{"question":{"show":{"answer":"answer","answers":"Answers:","body":"Текст вопроса","correct":"correct","new_answer":"Новый ответ","title":"Вопрос номер:"}},"show":{"no_question":"Question was not found."}},"tests":{"edit":{"title":"Update test."},"form":{"create":"Save"},"form_short":{"create":"Update"},"index":{"header":"Tests","title":"Tests"},"new":{"back":"Back","title":"New Test"},"show":{"action":"Действия","all_quest":"Questions.","all_tests":"Return to all tests","body":"Вопрос","new_question":"New question","title":"Test %{test} all question."},"update":{"test_cannot_save":"Test not saved, Check paramers, If you publish your test, check quеstions and answers"}}},"are_you_sure":"Are you sure?","back":"Back","cancel":"Cancel","cannot_publish_no_question_or_answer":"Cannot publish test. Test doesn\'t have question or answers.","controllers":{"admin":{"test":{"test_destroy_error":"Test has not been deleted. There are undeleted questions or test_passings."},"test_passing":{"gist_saved":"Question has beeт saved to:"}},"test":{"start_error":"Test is not valid. Please contact out techsupport."},"test_passing":{"no_answers":"Choose answer or answers."}},"date":{"abbr_day_names":["Sun","Mon","Tue","Wed","Thu","Fri","Sat"],"abbr_month_names":[null,"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"day_names":["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],"formats":{"default":"%Y-%m-%d","long":"%B %d, %Y","short":"%b %d"},"month_names":[null,"January","February","March","April","May","June","July","August","September","October","November","December"],"order":["year","month","day"]},"datetime":{"distance_in_words":{"about_x_hours":{"one":"about 1 hour","other":"about %{count} hours"},"about_x_months":{"one":"about 1 month","other":"about %{count} months"},"about_x_years":{"one":"about 1 year","other":"about %{count} years"},"almost_x_years":{"one":"almost 1 year","other":"almost %{count} years"},"half_a_minute":"half a minute","less_than_x_minutes":{"one":"less than a minute","other":"less than %{count} minutes"},"less_than_x_seconds":{"one":"less than 1 second","other":"less than %{count} seconds"},"over_x_years":{"one":"over 1 year","other":"over %{count} years"},"x_days":{"one":"1 day","other":"%{count} days"},"x_minutes":{"one":"1 minute","other":"%{count} minutes"},"x_months":{"one":"1 month","other":"%{count} months"},"x_seconds":{"one":"1 second","other":"%{count} seconds"}},"prompts":{"day":"Day","hour":"Hour","minute":"Minute","month":"Month","second":"Seconds","year":"Year"}},"destroy":"Destroy","devise":{"confirmations":{"confirmed":"Your email address has been successfully confirmed.","new":{"resend_confirmation_instructions":"Resend confirmation instructions"},"send_instructions":"You will receive an email with instructions for how to confirm your email address in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive an email with instructions for how to confirm your email address in a few minutes."},"failure":{"already_authenticated":"You are already signed in.","inactive":"Your account is not activated yet.","invalid":"Invalid %{authentication_keys} or password.","last_attempt":"You have one more attempt before your account is locked.","locked":"Your account is locked.","not_found_in_database":"Invalid %{authentication_keys} or password.","timeout":"Your session expired. Please sign in again to continue.","unauthenticated":"You need to sign in or sign up before continuing.","unconfirmed":"You have to confirm your email address before continuing."},"mailer":{"confirmation_instructions":{"action":"Confirm my account","greeting":"Welcome %{recipient}!","instruction":"You can confirm your account email through the link below:","subject":"Confirmation instructions"},"email_changed":{"greeting":"Hello %{recipient}!","message":"We\'re contacting you to notify you that your email has been changed to %{email}.","message_unconfirmed":"We\'re contacting you to notify you that your email is being changed to %{email}.","subject":"Email Changed"},"password_change":{"greeting":"Hello %{recipient}!","message":"We\'re contacting you to notify you that your password has been changed.","subject":"Password Changed"},"reset_password_instructions":{"action":"Change my password","greeting":"Hello %{recipient}!","instruction":"Someone has requested a link to change your password. You can do this through the link below.","instruction_2":"If you didn\'t request this, please ignore this email.","instruction_3":"Your password won\'t change until you access the link above and create a new one.","subject":"Reset password instructions"},"unlock_instructions":{"action":"Unlock my account","greeting":"Hello %{recipient}!","instruction":"Click the link below to unlock your account:","message":"Your account has been locked due to an excessive number of unsuccessful sign in attempts.","subject":"Unlock instructions"}},"omniauth_callbacks":{"failure":"Could not authenticate you from %{kind} because \\"%{reason}\\".","success":"Successfully authenticated from %{kind} account."},"passwords":{"edit":{"change_my_password":"Change my password","change_your_password":"Change your password","confirm_new_password":"Confirm new password","new_password":"New password"},"new":{"forgot_your_password":"Forgot your password?","send_me_reset_password_instructions":"Send me reset password instructions"},"no_token":"You can\'t access this page without coming from a password reset email. If you do come from a password reset email, please make sure you used the full URL provided.","send_instructions":"You will receive an email with instructions on how to reset your password in a few minutes.","send_paranoid_instructions":"If your email address exists in our database, you will receive a password recovery link at your email address in a few minutes.","updated":"Your password has been changed successfully. You are now signed in.","updated_not_active":"Your password has been changed successfully."},"registrations":{"destroyed":"Bye! Your account has been successfully cancelled. We hope to see you again soon.","edit":{"are_you_sure":"Are you sure?","cancel_my_account":"Cancel my account","currently_waiting_confirmation_for_email":"Currently waiting confirmation for: %{email}","leave_blank_if_you_don_t_want_to_change_it":"leave blank if you don\'t want to change it","title":"Edit %{resource}","unhappy":"Unhappy?","update":"Update","we_need_your_current_password_to_confirm_your_changes":"we need your current password to confirm your changes"},"new":{"sign_up":"Sign up"},"signed_up":"Welcome! You have signed up successfully.","signed_up_but_inactive":"You have signed up successfully. However, we could not sign you in because your account is not yet activated.","signed_up_but_locked":"You have signed up successfully. However, we could not sign you in because your account is locked.","signed_up_but_unconfirmed":"A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.","update_needs_confirmation":"You updated your account successfully, but we need to verify your new email address. Please check your email and follow the confirmation link to confirm your new email address.","updated":"Your account has been updated successfully.","updated_but_not_signed_in":"Your account has been updated successfully, but since your password was changed, you need to sign in again."},"sessions":{"already_signed_out":"Signed out successfully.","new":{"sign_in":"Log in"},"signed_in":"Welcome. Signed in successfully.","signed_out":"Signed out successfully."},"shared":{"links":{"back":"Back","didn_t_receive_confirmation_instructions":"Didn\'t receive confirmation instructions?","didn_t_receive_unlock_instructions":"Didn\'t receive unlock instructions?","forgot_your_password":"Forgot your password?","sign_in":"Log in","sign_in_with_provider":"Sign in with %{provider}","sign_up":"Sign up"},"minimum_password_length":{"one":"(%{count} character minimum)","other":"(%{count} characters minimum)"}},"unlocks":{"new":{"resend_unlock_instructions":"Resend unlock instructions"},"send_instructions":"You will receive an email with instructions for how to unlock your account in a few minutes.","send_paranoid_instructions":"If your account exists, you will receive an email with instructions for how to unlock it in a few minutes.","unlocked":"Your account has been unlocked successfully. Please sign in to continue."}},"edit":"Update","errors":{"connection_refused":"Oops! Failed to connect to the Web Console middleware.\\nPlease make sure a rails development server is running.\\n","format":"%{attribute} %{message}","messages":{"accepted":"must be accepted","already_confirmed":"was already confirmed, please try signing in","blank":"can\'t be blank","confirmation":"doesn\'t match %{attribute}","confirmation_period_expired":"needs to be confirmed within %{period}, please request a new one","empty":"can\'t be empty","equal_to":"must be equal to %{count}","even":"must be even","exclusion":"is reserved","expired":"has expired, please request a new one","greater_than":"must be greater than %{count}","greater_than_or_equal_to":"must be greater than or equal to %{count}","inclusion":"is not included in the list","invalid":"is invalid","less_than":"must be less than %{count}","less_than_or_equal_to":"must be less than or equal to %{count}","model_invalid":"Validation failed: %{errors}","not_a_number":"is not a number","not_an_integer":"must be an integer","not_found":"not found","not_locked":"was not locked","not_saved":{"one":"1 error prohibited this %{resource} from being saved:","other":"%{count} errors prohibited this %{resource} from being saved:"},"odd":"must be odd","other_than":"must be other than %{count}","present":"must be blank","required":"must exist","taken":"has already been taken","too_long":{"one":"is too long (maximum is 1 character)","other":"is too long (maximum is %{count} characters)"},"too_short":{"one":"is too short (minimum is 1 character)","other":"is too short (minimum is %{count} characters)"},"wrong_length":{"one":"is the wrong length (should be 1 character)","other":"is the wrong length (should be %{count} characters)"}},"unacceptable_request":"A supported version is expected in the Accept header.\\n","unavailable_session":"Session %{id} is no longer available in memory.\\n\\nIf you happen to run on a multi-process server (like Unicorn or Puma) the process\\nthis request hit doesn\'t store %{id} in memory. Consider turning the number of\\nprocesses/workers to one (1) or using a different server in development.\\n"},"feedback":{"feedback":{"return_main_page":"Return to main page","success":"You feedback successfully sent."},"show":{"feedback_text":"Writedown your feedback:","submit":"Submit","title":"Feedback form"}},"feedback_link":"Leave your feedback here!","flash":{"actions":{"create":{"notice":"%{resource_name} was successfully created."},"destroy":{"alert":"%{resource_name} could not be destroyed.","notice":"%{resource_name} was successfully destroyed."},"update":{"notice":"%{resource_name} was successfully updated."}}},"footer":{"part1":"Hi, my name is Alex and I study Ruby on Rails","part2":"This project link %{github}","part3":"My cource in on-line school %{href}"},"gist_save":"Question about %{test}.","helpers":{"label":{"test":{"category":"Select Category","level":"Level","title":"Test title"}},"select":{"prompt":"Please select"},"submit":{"create":"Create %{model}","submit":"Save %{model}","test":{"create":"Create","update":"Update"},"update":"Update %{model}"}},"menu":{"guru":"Guru","login":"Login","logout":"Logout","main":"TestGuru","register":"Register","tests":"Tests","welcome":"Welcome"},"number":{"currency":{"format":{"delimiter":",","format":"%u%n","precision":2,"separator":".","significant":false,"strip_insignificant_zeros":false,"unit":"$"}},"format":{"delimiter":",","precision":3,"round_mode":"default","separator":".","significant":false,"strip_insignificant_zeros":false},"human":{"decimal_units":{"format":"%n %u","units":{"billion":"Billion","million":"Million","quadrillion":"Quadrillion","thousand":"Thousand","trillion":"Trillion","unit":""}},"format":{"delimiter":"","precision":3,"significant":true,"strip_insignificant_zeros":true},"storage_units":{"format":"%n %u","units":{"byte":{"one":"Byte","other":"Bytes"},"eb":"EB","gb":"GB","kb":"KB","mb":"MB","pb":"PB","tb":"TB"}}},"nth":{},"percentage":{"format":{"delimiter":"","format":"%n%"}},"precision":{"format":{"delimiter":""}}},"profile":{"form":{"create":"Submit","email":"Email","first_name":"First name","last_name":"Last name","login":"Login"},"show":{"your_badges":"Your badges"},"update":{"user_updated":"User updated"}},"question":"Question","show":"Show","start":"Start","support":{"array":{"last_word_connector":", and ","two_words_connector":" and ","words_connector":", "}},"test_destroyed":"Test was successfully destroyed.","test_not_destroyed":"Test has not been deleted. Ask support","test_passing":{"result":{"all_tests":"Назад ко всем тестам","bad_result":"Test has not been completed","mark":"Ваша оценка:","result":"Ваш результат:","success":"Test has been completed"},"save":{"gist_not_saved":"Question has not been saved","gist_saved":"Question has been saved: "},"show":{"no_test_passing":"Test_passing was not found.","submit":"submit"},"update":{"no_answers":"Choose answer or answers."}},"test_updated":"Test was successfully updated.","test_was_not_found":"Test was not found","tests":{"index":{"actions":"Actions","published":"Published","title":"Tests111"}},"time":{"am":"am","formats":{"default":"%a, %d %b %Y %H:%M:%S %z","long":"%B %d, %Y %H:%M","short":"%d %b %H:%M"},"pm":"pm"},"un_valid":"Un valid value"}'));
I18n.translations["ru"] = I18n.extend((I18n.translations["ru"] || {}), JSON.parse('{"activerecord":{"attributes":{"answer":{"correct":"Правильность","value":"Ответ"},"question":{"body":"Вопрос"},"test":{"author_id":"Автор","level":"Уровень","title":"Название"},"user":{"admin":"Администратор","confirmation_sent_at":"Дата отправки подтверждения","confirmation_token":"Токен подтверждения","confirmed_at":"Дата подтверждения","created_at":"Дата создания","current_password":"Текущий пароль","current_sign_in_at":"Дата текущего входа","current_sign_in_ip":"IP текущего входа","email":"Электронная почта","encrypted_password":"Зашифрованный пароль","failed_attempts":"Неудачные попытки","first_name":"Имя","last_name":"Фамилия","last_sign_in_at":"Дата последнего входа","last_sign_in_ip":"IP последнего входа","locked_at":"Дата блокировки","login":"Логин","password":"Пароль","password_confirmation":"Подтверждение пароля","remember_created_at":"Дата создания запоминания","remember_me":"Запомнить меня","reset_password_sent_at":"Дата отправки сброса пароля","reset_password_token":"Токен сброса пароля","sign_in_count":"Количество входов","unconfirmed_email":"Неподтвержденный email","unlock_token":"Токен разблокировки","updated_at":"Дата обновления"}},"models":{"user":{"few":"Пользователя","many":"Пользователей","one":"Пользователь","other":"Пользователи"}}},"admin":{"badges":{"create":{"cannot_save_badge":"Бадже не сохранился. Проверьте параметры"},"edit":{"title":"Создать Бейдж"},"form":{"activated":"Активирован","category":"Категория","create":"Создать","first_time":"С первого раза","image":"Изображение","level":"Уровень","title":"Название"},"index":{"badges":"Бейджи","condition":"Условие","new_badge":"Создать новый бейдж","picture":"Изображение","title":"Название"},"new":{"title":"Бейджи"},"show":{"title":"Бейджи"}},"gists":{"index":{"gist_hash":"Gist","question":"Вопрос","title":"Список Gist ссылок","user":"Пользователь"}},"question":{"show":"Вопрос не найден."},"questions":{"show":{"answer":"Ответ","answers":"Ответы:","body":"Текст вопроса","correct":"Правильность","new_answer":"Новый ответ","no_question":"Question was not found.","title":"Вопрос номер:"}},"tests":{"edit":{"title":"Изменить тест."},"form":{"create":"Сохранить"},"index":{"actions":"Действия","header":"Тесты","new_test":"Новый тест","published":"Опубликован","title":"Название Теста"},"new":{"title":"Название теста"},"show":{"action":"Действия","all_quest":"Все вопросы.","all_tests":"Вернуться на все вопросы","body":"Вопрос","new_question":"Новый вопрос","title":"Тест %{test} и вопросы"},"update":{"test_cannot_save":"Тест не сохранен, проверьте отправляемые парметры, если вы побликуете тес проверьте наличие вопросов и ответов."}}},"are_you_sure":"Вы уверены?","back":"Обратно","cancel":"Отменить","cannot_publish_no_question_or_answer":"Нельзя опубликовать тест: У теста нет вопросов или ответов.","controllers":{"admin":{"test":{"test_destroy_error":"Тест не удален. Возможно остались не удаленные вопросы или прохождения тестов."},"test_passing":{"gist_saved":"Вопрос сохранян по ссылке: "}},"test":{"start_error":"Тест не завершен. Пожалуйста, напишите в службу поддержки."},"test_passing":{"update":{"no_answers":"Выберете варианты ответа."}}},"destroy":"Удалить","devise":{"confirmation":{"email":"email","resend":"resend"},"confirmations":{"confirmed":"Ваша учётная запись успешно подтверждена.","new":{"resend_confirmation_instructions":"Выслать повторно письмо с активацией"},"send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по подтверждению вашей учётной записи.","send_paranoid_instructions":"Если ваш адрес email есть в нашей базе данных, то в течение нескольких минут вы получите письмо с инструкциями по подтверждению вашей учётной записи."},"failure":{"already_authenticated":"Вы уже вошли в систему.","inactive":"Ваша учётная запись ещё не активирована.","invalid":"Неверный %{authentication_keys} или пароль.","last_attempt":"У Вас осталась еще одна попытка ввести пароль до блокировки.","locked":"Ваша учётная запись заблокирована.","not_found_in_database":"Неверный %{authentication_keys} или пароль.","timeout":"Ваш сеанс закончился. Пожалуйста, войдите в систему снова.","unauthenticated":"Вам необходимо войти в систему или зарегистрироваться.","unconfirmed":"Вы должны подтвердить вашу учётную запись."},"mailer":{"confirmation_instructions":{"action":"Активировать","greeting":"Здравствуйте, %{recipient}!","instruction":"Вы можете активировать свою учетную запись, нажав ссылку снизу:","subject":"Инструкции по подтверждению учётной записи."},"email_changed":{"greeting":"Здравствуйте, %{recipient}!","message":"Мы пытаемся связаться с вами, что бы сообщить, что ваш email был изменен на %{email}.","message_unconfirmed":null,"subject":"Еmail адрес был изменён."},"password_change":{"greeting":"Приветствуем, %{recipient}!","message":"Мы пытаемся связаться с вами, что бы сообщить, что ваш пароль был изменен.","subject":"Пароль был изменён."},"reset_password_instructions":{"action":"Изменить пароль","greeting":"Здравствуйте, %{recipient}!","instruction":"Вы (или кто-то еще) запросили изменение пароля. Для изменения пароля нажмите ссылку ниже:","instruction_2":"Если вы не запрашивали изменение пароля - проигнорируйте это сообщение","instruction_3":"Ваш пароль не изменится пока вы не нажмете на ссылку и не введете новый.","subject":"Инструкции по восстановлению пароля."},"unlock_instructions":{"action":"Разблокировать учетную запись","greeting":"Здравствуйте, %{recipient}!","instruction":"Нажмите ссылку для активации учетной записи:","message":"Ваша учетная запись была заблокирована в связи с превышением лимита неудачных попыток входа.","subject":"Инструкции по разблокировке учётной записи."}},"omniauth_callbacks":{"failure":"Вы не можете войти в систему с учётной записью из %{kind}, так как \\"%{reason}\\".","success":"Вход в систему выполнен с учётной записью из %{kind}."},"passwords":{"edit":{"change_my_password":"Изменить мой пароль","change_your_password":"Изменить пароль","confirm_new_password":"Повторите новый пароль","new_password":"Новый пароль"},"new":{"forgot_your_password":"Забыли пароль?","send_me_reset_password_instructions":"Выслать новый пароль"},"no_token":"Эта страница доступна только при переходе с email для сброса пароля. Если Вы перешли по ссылке из письма, пожалуйста, убедитесь, что вы использовали полный URL.","send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по восстановлению вашего пароля.","send_paranoid_instructions":"Если ваш адрес email есть в нашей базе данных, то в течение нескольких минут Вы получите письмо с инструкциями по восстановлению вашего пароля.","updated":"Ваш пароль успешно изменён. Теперь вы вошли в систему.","updated_not_active":"Пароль успешно изменён."},"registrations":{"destroyed":"До свидания! Ваша учётная запись успешно удалена. Надеемся снова увидеть вас.","edit":{"are_you_sure":"Вы уверены?","cancel_my_account":"Удалить учетную запись","currently_waiting_confirmation_for_email":"Ожидается подтверждение адреса E-mail: %{email}","leave_blank_if_you_don_t_want_to_change_it":"оставьте поле пустым, если не хотите его менять","title":"Редактировать %{resource}","unhappy":"Разочарованы?","update":"Обновить","we_need_your_current_password_to_confirm_your_changes":"введите текущий пароль для подтверждения изменений"},"new":{"sign_up":"Регистрация"},"signed_up":"Добро пожаловать! Вы успешно зарегистрировались.","signed_up_but_inactive":"Вы успешно зарегистрировались. Тем не менее, вы не можете войти, потому что ваша учетная запись ещё не активирована.","signed_up_but_locked":"Вы успешно зарегистрировались. Тем не менее, вы не можете войти, потому что ваша учетная запись заблокирована.","signed_up_but_unconfirmed":"В течение нескольких минут вы получите письмо с инструкциями по подтверждению вашей учётной записи.","update_needs_confirmation":"Ваш аккаунт успешно обновлен, но необходимо подтвердить Ваш новый адрес email. Пожалуйста, проверьте свою электронную почту и нажмите на ссылку \\"Подтвердить\\", чтобы завершить обновления email.","updated":"Ваша учётная запись успешно изменена.","updated_but_not_signed_in":"Ваш аккаунт успешно изменен, но так как ваш пароль изменился, нужно войти снова."},"sessions":{"already_signed_out":"Выход из системы выполнен.","new":{"sign_in":"Войти"},"signed_in":"Вход в систему выполнен.","signed_out":"Выход из системы выполнен."},"shared":{"links":{"back":"Назад","didn_t_receive_confirmation_instructions":"Не получили подтверждение?","didn_t_receive_unlock_instructions":"Не получили код разблокировки?","forgot_your_password":"Забыли пароль?","sign_in":"Войти","sign_in_with_provider":"Войти с помощью: %{provider}","sign_up":"Регистрация"},"minimum_password_length":{"few":"(минимум %{count} знака)","many":"(минимум %{count} знаков)","one":"(минимум %{count} знак)","other":"(минимум %{count} знаков)"}},"unlocks":{"new":{"resend_unlock_instructions":"Выслать подтверждение заново"},"send_instructions":"В течение нескольких минут вы получите письмо с инструкциями по разблокировке вашей учётной записи.","send_paranoid_instructions":"Если ваша учётная запись существует, то в течение нескольких минут вы получите письмо с инструкциями по её разблокировке.","unlocked":"Ваша учётная запись разблокирована. Теперь вы вошли в систему."}},"edit":"Изменить","errors":{"messages":{"already_confirmed":"уже подтверждена. Пожалуйста, попробуйте войти в систему","confirmation_period_expired":"должен быть подтвержден в течении %{period}, пожалуйста, запросите подтверждение ещё раз","expired":"устарела. Пожалуйста, запросите новую","not_found":"не найдена","not_locked":"не заблокирована","not_saved":{"few":"%{resource}: сохранение не удалось из-за %{count} ошибок","many":"%{resource}: сохранение не удалось из-за %{count} ошибок","one":"%{resource}: сохранение не удалось из-за %{count} ошибки","other":"%{resource}: сохранение не удалось из-за %{count} ошибки"}}},"feedback":{"feedback":{"return_main_page":"Вернуться на главную страницу","success":"Ваша обратная связь принята."},"show":{"feedback_text":"Напишите Ваш отзыв:","submit":"Отправить","title":"Форма обратной связи"}},"feedback_link":"Оставьте отзыв о работе проекта!","footer":{"part1":"Меня зовут Алексей, изучаю Ruby on Rails","part2":"Ссылка на репозиторий проекта %{github}","part3":"Учебный проект в онлайн-школе %{href}"},"gist_save":"Вопрос про %{test}.","helpers":{"label":{"question":{"body":"Текст вопроса"},"test":{"category":"Выбор категории","level":"Уровень","title":"Название теста"},"test_passing":{"create":"следующий","update":"следующий"}},"select":{"prompt":"Cделайте выбор"},"submit":{"question":{"create":"Создать вопрос"},"test":{"create":"Создать","update":"Обновить"},"test_passing":{"create":"cледующий","show":"следующий","update":"следующий"}}},"menu":{"guru":"Гуру","login":"Войти","logout":"Выйти","main":"ТестГуру","register":"Зарегистрироваться","tests":"Тесты","welcome":"Добро пожаловать"},"next":"Cледующией","question":"Вопрос","show":"Показать","start":"Старт","test_destroyed":"Тест успешно удален","test_not_destroyed":"Не удалось удалить тест.Обратесь в поддержку.","test_passing":{"result":{"all_tests":"Назад ко всем тестам","bad_result":"Тест не пройдет =(","mark":"Ваша оценка:","result":"Ваш результат:","success":"Тест успешно пройден!"},"save":{"gist_not_saved":"Вопрос не был сохранен.","gist_saved":"Вопрос сохранен: "},"show":{"no_test_passing":"Test_passing не найден.","submit":"Отправить"},"update":{"no_answers":"Выберите варианты ответа."}},"test_updated":"Тест успешно обновлен.","test_was_not_found":"Тест не был найден.","tests":{"index":{"actions":"Действия","test_tile":"Названия теста","title":"Тесты"},"new":{"title":"Создать новый тест"}},"un_valid":"Не правильное значение"}'));
