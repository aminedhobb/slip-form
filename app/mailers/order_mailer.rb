class OrderMailer < ApplicationMailer

  def send_survey(order_params)
    @url_params = {
      order_id: order_params[:id],
      customer_name: order_params[:name],
      customer_mail: order_params[:mail]
    }

    @customer_name = order_params[:name]
    mail(
      to: order_params[:mail],
      subject: "Satisfaction form for order #{order_params[:id]}"
    )
  end
end
