class FeedbackMailer < ApplicationMailer

  default from: 'no_reply@boodet.online'

  def feedback_email
    @user_email = params[:user_email]
    @feedback = params[:feedback]
    mail(to: @user_email, subject: 'New user feedback')
  end
end
