class AnswersController < ApplicationController

  def new
    render_error and return if [:order_id, :customer_name, :customer_mail].any? { |k| order_params[k].nil? }
    @answer = Answer.new(order_params)
    @order_params = order_params.to_h
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      AnswerMailer.answer_recap(answer_params.to_h).deliver_now
      render :accepted
    else
      redirect_to new_answer_path(answer_params.slice(
                                    :customer_mail,
                                    :customer_name,
                                    :order_id
                                  ))
      flash[:alert] = 'One or several answers are missing'
    end
  end

  def accepted
  end

  private

  def render_error
    render json: { error: 'one or several parameters are missing' }, status: :unprocessable_entity
  end

  def order_params
    params.permit(:customer_name, :customer_mail, :order_id)
  end

  def answer_params
    params.require(:answer).permit(:customer_mail, :customer_name, :order_id,
      :satisfaction_rating, :shipping_rating, :products_quality_rating, :comment)
  end
end
