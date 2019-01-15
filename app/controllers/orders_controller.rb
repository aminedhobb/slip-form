class OrdersController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create

  def create
    render_error and return if [:order_id, :customer_name, :customer_mail].any? { |k| permitted_params[k].blank? }
    OrderMailer.send_survey(permitted_params.to_h).deliver_now
  end

  private

  def render_error
    render json: { error: 'one or several paramaters are missing' },
           status: :unprocessable_entity
  end

  def permitted_params
    params.permit(:order_id, :customer_name, :customer_mail)
  end
end
