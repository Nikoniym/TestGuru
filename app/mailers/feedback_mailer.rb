class FeedbackMailer < ApplicationMailer


  def send_feedback(feedback)
    @feedback = feedback
    @user = feedback.user

    mail from: @user.email, to: Admin.find_by(email: 'worldnillin@gmail.com').email
  end
end
