class AnswerMailer < ApplicationMailer

  def answer_recap(answer_params)
    @answer_params = answer_params
    mail(
      to: "admin@slip.com",
      subject: "#{answer_params[:customer_mail]} answered your satisfaction
      survey"
    )
  end
end
