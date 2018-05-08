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
      test_count = Test.where(level: badge.level).count
      current_tests = @user.tests.where(level: badge.level).uniq

      compare_unit(test_count, current_tests, badge) if test_count == current_tests.count
    end
  end

  def rule_category(badge)
    if @test.category.title == badge.category
      test_count = Test.joins(:category).where(categories: {title: badge.category}).count
      current_tests = @user.tests.joins(:category).where(categories: {title: badge.category}).uniq

      compare_unit(test_count, current_tests, badge) if test_count == current_tests.count
    end
  end

  def compare_unit(test_count, current_tests, badge)
    test_passed_count = 0

    current_tests.each do |test|
      passed_count = false

      test.test_passages.where(user: @user).each do |test_passage|
        passed_count = true if test_passage.passed?
      end

      test_passed_count += 1 if passed_count
    end

    @badges << badge if test_count ==  test_passed_count
  end
end