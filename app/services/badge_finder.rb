class BadgeFinder

  attr_accessor :condition, :badge

  def initialize(test_passing)
    @tp = test_passing
    @condition = []
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
    args = Badge.attribute_names + Badge.reflect_on_all_associations.map { |sym| sym.name.to_s }
    args.each do |arg|
      send("#{arg}_check") if self.class.method_defined? "#{arg}_check"
    end
    result_for_badge
  end

  def result_for_badge
    return false if @condition.empty?

    result = true
    @condition.each do |con|
      result = false unless con
    end
    @condition = []

    result
  end

  def first_time_check
    return unless @badge.first_time

    first_time_result = TestPassing.where({ user_id: @tp.user_id, test_id: @tp.test_id }).count == 1
    @condition << first_time_result
  end

  def level_check
    return unless @badge.level.present?

    tests = Test.where(level: @badge.level)

    return unless tests.present?

    tests.each do |test|
      @condition << false if find_testpassing(test)
    end
    @condition << true
  end

  def categories_check
    return unless @badge.categories.present?

    @condition << find_badge_by_category if @badge.categories.map(&:id).include?(@tp.test.category.id)
  end

  def find_badge_by_category
    @badge.categories.each do |category|
      tests = Test.where(category: category.id)
      return false if tests.empty?

      tests.each do |test|
        return false if find_testpassing(test)
      end
    end

    true
  end

  def l_c(level)
    # return unless @badge.level.present?
    tests = Test.where(level: level)

    return unless tests.present?

    tests.each do |test|
      return false if find_testpassing(test)
    end
    return true
  end

  def find_testpassing(test)
    TestPassing.where({ test_id: test.id, user_id: @tp.user.id }).select(&:successfull?).empty?
  end
end
