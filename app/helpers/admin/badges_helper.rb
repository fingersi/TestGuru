module Admin::BadgesHelper
  def condition_view(badge, admin = false)
    result = ''
    result += category_view(badge) if badge.categories.present?|| admin
    result += level_view(badge) if badge.level.present? || admin
    result += first_time_view(badge) if badge.first_time.present? || admin
    result
  end

  def category_view(badge)
    result = ''
    result += 'category: ' if badge.categories.present?
    badge.categories.each do |cat|
      result += "#{cat.title} "
    end
    result += ' '
    result
  end

  def level_view(badge)
    "level: #{badge.level} "
  end

  def first_time_view(badge)
    badge.first_time ? 'first_time: true ' : 'first_time: false '
  end
end
