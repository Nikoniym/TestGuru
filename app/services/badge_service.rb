class BadgeService
  def initialize(test_passage)
    @test_passage = test_passage
    @test = test_passage.test
    @user = test_passage.user
    @push_badge = false
    @badges = []
  end

  def call
    Badge.all.each do |badge|
        @badge = badge
        case badge.rule
          when '1' then rule_category
          when '2' then rule_first_time
          when '3' then rule_level
        end
    end
  end

  def push_badge?
    @push_badge
  end

  def badges
    @badges
  end

  def badges_title
    @badges.pluck(:title).join(', ')
  end

  private

  def rule_first_time
    if @test.title == @badge.parameter && @user.tests.where(title: @badge.parameter).count == 1
      push_badge!
    end
  end

  def rule_level
    if @test.level == @badge.parameter.to_i
      test_count = Test.where(level: @badge.parameter).count
      current_tests = @user.tests.where(level: @badge.parameter).uniq

      compare_unit(test_count, current_tests) if test_count == current_tests.count
    end
  end

  def rule_category
    if @test.category.title == @badge.parameter
      test_count = Test.joins(:category).where(categories: {title: @badge.parameter}).count
      current_tests = @user.tests.joins(:category).where(categories: {title: @badge.parameter}).uniq

      compare_unit(test_count, current_tests) if test_count == current_tests.count
    end
  end

  def compare_unit(test_count, current_tests)
    test_passed_count = 0

    current_tests.each do |test|
      passed_count = false

      test.test_passages.where(user: @user).each do |test_passage|
        passed_count = true if test_passage.passed?
      end

      test_passed_count += 1 if passed_count
    end

    push_badge! if test_count ==  test_passed_count
  end

  def push_badge!
    @user.badges.push(@badge)
    @push_badge = true
    @badges << @badge
  end
end