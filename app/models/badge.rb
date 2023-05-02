class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :user_badges
  has_and_belongs_to_many :categories
  belongs_to :image, optional: true

  def self.find_badge(test_passing)
    result = []
    Badge.where({ activated: true }).each do |badge|
      next unless badge.check_badge_condition(test_passing)

      user_badge = UserBadge.new({ user: test_passing.user, badge: badge })
      user_badge.save
      result << user_badge
    end
    result
  end

  def check_badge_condition(test_passing)
    condition = false
    condition = test_passing.test.level == level if level_condition
    condition = check_categories(test_passing.test.category) if category_condition
    condition = first_time? if first_time
    condition
  end

  def first_time?
    return true if TestPassing.where({ user: test_passing.user.id, test: test_passing.test.id }).count == 1

    false
  end

  def condition_view(admin = false)
    result = ''
    result += category_view if category_condition || admin
    result += level_view if level_condition || admin
    result += first_time_view if first_time || admin
    result
  end

  def admin_condition
    result = ''
    result += category_view
    result += level_view
    result += first_time_view
    result
  end

  def category_view
    result = ''
    result += 'category: ' if categories.present?
    categories.each do |cat|
      result += "#{cat.title} "
    end
    result += ' '
    result
  end

  def level_view
    "level: #{level} "
  end

  def first_time_view
    first_time ? 'first_time: true ' : 'first_time: false '
  end

  def picture_path
    image&.picture_path
  end

  def condition_value
    return categores if category_condition

    return level if level_condition

    return first_time if first_time
  end

  def check_categories(test_category)
    result = false
    categories.each do |category|
      result = category == test_category
    end
    result
  end
end
