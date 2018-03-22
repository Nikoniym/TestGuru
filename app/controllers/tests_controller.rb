class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    test = Test.new(test_params)
    test.author_id = 1
    if test.save!
      redirect_to  test_path(test)
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end