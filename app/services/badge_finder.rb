class BadgeFinder

  def initialize(test_passing)
    @tp = test_passing
  end

  def find_badge
    Badge.all_activated.each do |badge|
      @badge = badge
      next unless check_badge_condition

      @tp.badges << badge
      @tp.save
    end
  end

  def check_badge_condition
    self.class.method_defined?("#{@badge.condition}_check") ? send("#{@badge.condition}_check") : false
  end

  def first_time_check
    TestPassing.where({ user_id: @tp.user_id, test_id: @tp.test_id }).count == 1
  end

  def level_check
    return false unless @badge.value.to_i.present?

    find_testpassing(Test.where(level: @badge.value.to_i))
  end

  def category_check
    category = Category.where(title: @badge.value)
    return false unless category.present?

    find_testpassing(Test.where(category: category))
  end

  def find_testpassing(tests)
    return false unless tests.present?

    user_tests = TestPassing.where({ test_id: tests, user_id: @tp.user_id, successfull: true }).pluck(:test_id).uniq
    included_in?(tests.pluck(:id), user_tests)
  end

  def included_in?(src, target)
    return true if src.each { |i| break unless target.to_a.include?(i) }

    false
  end
end
