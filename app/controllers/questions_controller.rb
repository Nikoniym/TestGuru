class QuestionsController < ApplicationController
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[show destroy edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_from_question_not_found

  def show
  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.new(question_params)
    if @question.save
      redirect_to @question.test
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @question.update(test_params)
      redirect_to  question_path(@question)
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    redirect_to @question.test
  end

  private

  def question_params
    params.require(:question).permit(:body)
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_from_question_not_found
    render plain: 'Вопрос не найден'
  end
end