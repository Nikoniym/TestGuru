class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result
    if @test_passage.passed?
      service = BadgeService.new(@test_passage)
      service.call
      flash.now[:notice] ="#{I18n.t('badge', count: service.badges.count)} #{service.badges_title}" if service.push_badge?
    end
  end

  def gist
    result = GistQuestionService.new(@test_passage.current_question).call

    flash_options = if result&.html_url.present?
                      create_gist!(result.html_url)
                      { notice: t('.success', url: result.html_url) }
                    else
                      { alert: t('.failure') }
                    end

    redirect_to @test_passage, flash_options
  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed? || @test_passage.time_over?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def create_gist!(url)
    current_user.gists.create!(question: @test_passage.current_question, url: url)
  end
end
