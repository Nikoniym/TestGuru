class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(feedback_params)
    @feedback.user = current_user
    if @feedback.save
      redirect_to  new_feedback_path, notice: t('.success')
    else
      render :new
    end
  end

  private

  def feedback_params
    params.require(:feedback).permit(:title, :body)
  end
end
