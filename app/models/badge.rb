class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :test_passing
  has_and_belongs_to_many :categories
  belongs_to :image, optional: true
  has_and_belongs_to_many :test_passings

  scope :all_activated, -> { where(activated: true) }

  def self.find_badge(test_passing)
    Badge.all_activated.each do |badge|
      next unless badge.check_badge_condition(test_passing)

      test_passing.badges << badge
      test_passing.save
    end
  end

  def check_badge_condition(test_passing)
    condition = false
    condition = test_passing.test.level == level if level_condition
    condition = check_categories(test_passing.test.category) if category_condition
    condition = first_time_check(test_passing) if first_time
    condition
  end

  def first_time_check(test_passing)
    return true if TestPassing.where({ user_id: test_passing.user_id, test_id: test_passing.test_id }).count == 1

    false
  end

  def check_categories(test_category)
    result = false
    categories.each do |category|
      result = category == test_category
    end
    result
  end

  def picture_path
    image&.picture_path
  end
end
