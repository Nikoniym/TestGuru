class TestsController < ApplicationController
  before_action :find_test, only: %i[show destroy edit update]

  def index
    @tests = Test.all
  end

  def show
  end

  def new
    @test = Test.new
  end

  def create
    @test = Test.new(test_params)
    @test.author_id = 1
    if @test.save
      redirect_to  test_path(@test)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @test.update(test_params)
      redirect_to  test_path(@test)
    else
      render :edit
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
