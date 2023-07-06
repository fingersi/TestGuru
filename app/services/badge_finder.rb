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
    return unless tests.present?

    tests.each do |test|
      return false if TestPassing.where({ test_id: test.id, user_id: @tp.user_id, successfull: true }).empty?
    end
    true
  end
end
