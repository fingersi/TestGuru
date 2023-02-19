class FeedbackController < ApplicationController

  before_action :feedback_params, only: %i[feedback]

  def show
  end

  def feedback
    Admin.find_each do |adm|
      FeedbackMailer.with(user_email: adm.email, feedback: feedback_params).feedback_email.deliver_later
    end
  end

  private

  def feedback_params
    params.require(:feedback)
  end
end
