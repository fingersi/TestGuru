class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_and_belongs_to_many :test_passings

  validates :condition, inclusion: { in: %w[category first_time level],
                                     message: ' value should be only: category, first_time, level.' }
  validates :title, presence: true
  validates :picture_path, presence: true
  validates_with BadgeValidator

  scope :all_activated, -> { where(activated: true) }

  def check_badge_condition(test_passing)
    self.class.method_defined?("#{condition}_check") ? send("#{condition}_check", test_passing) : false
  end

  def first_time_check(test_passing)
    TestPassing.where({ user_id: test_passing.user_id, test_id: test_passing.test_id }).count == 1
  end

  def level_check(test_passing)
    return false unless value.to_i.present?

    tests = Test.where(level: value.to_i)

    return unless tests.present?

    tests.each do |test|
      return false if find_testpassing(test, test_passing.user.id)
    end
    true
  end

  def category_check(test_passing)
    category = Category.find(value.to_i)
    return false unless category.present?

    tests = Test.where(category: category.id)

    return false if tests.empty?

    tests.each do |test|
      return false if find_testpassing(test, test_passing.user.id)
    end

    true
  end

  def find_testpassing(test, user_id)
    TestPassing.where({ test_id: test.id, user_id: user_id }).select(&:successfull?).empty?
  end
end
