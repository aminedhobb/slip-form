class OrderMailer < ApplicationMailer

  def send_survey(order_params)

    @url_params = order_params

    @customer_name = order_params[:customer_name]
    mail(
      to: order_params[:customer_mail],
      subject: "Satisfaction form for order #{order_params[:order_id]}"
    )
  end
end
