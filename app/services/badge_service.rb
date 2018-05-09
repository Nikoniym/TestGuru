class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @badges = []
  end

  def call
    Badge.find_each do |badge|
        send "rule_#{badge.rule}", badge
    end
  end

  def badges
    @badges
  end

  private

  def rule_first_time(badge)
    if @user.tests.where(title: @test.title).count == 1
      @badges << badge
    end
  end

  def rule_level(badge)
    if @test.level == badge.level.to_i
      tests_ids = Test.where(level: badge.level).pluck(:id)
      current_tests = @user.test_passages.joins(:test).where(tests: { level: badge.level })

      compare_unit(tests_ids, current_tests, badge)
    end
  end

  def rule_category(badge)
    if @test.category.title == badge.category
      tests_ids = Test.joins(:category).where(categories: { title: badge.category }).pluck(:id)
      current_tests = @user.test_passages.joins(:test => :category).where(tests: { categories: { title: badge.category } })

      compare_unit(tests_ids, current_tests, badge)
    end
  end

  def compare_unit(tests_ids, current_tests, badge)
    current_tests_passed = current_tests.select { |test| test.passed? }

    if tests_ids.sort == current_tests_passed.pluck(:test_id).uniq.sort && !@user.badges.include?(badge)
      @badges << badge
    end
  end
end