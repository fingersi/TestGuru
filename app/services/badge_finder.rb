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

    target_ids = Test.where(level: @badge.value.to_i).sort.pluck(:id)
    user_ids = TestPassing.where({ test_id: target_ids, user_id: @tp.user.id, successfull: true }).distinct.sort.pluck(:test_id)
    target_ids == user_ids
  end

  def category_check
    category = Category.where(title: @badge.value)
    return false unless category.present?

    target_ids = Test.where(category: category).sort.pluck(:id)
    user_ids = TestPassing.where({ test_id: target_ids, user_id: @tp.user.id, successfull: true }).distinct.sort.pluck(:test_id)
    target_ids == user_ids
  end
end
