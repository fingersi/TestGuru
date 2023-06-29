class BadgeValidator < ActiveModel::Validator

  def validate(record)
    return unless record.activated

    case record.condition
    when 'category'
      category_validation(record)
    when 'level'
      record.errors.add(:value, "If Condition = 'level', value shoud be integer.") unless i?(record.value)
    end
  end

  def i?(str)
    /\A[-+]?\d+\z/.match(str) ? true : false
  end

  def category_validation(record)
    unless i?(record.value)
      record.errors.add(:value, "If Condition = 'condition', value shoud be integer.")

      return
    end

    if Category.where(id: record.value.to_i).empty?
      record.errors.add(:value, "If Badge Condition: 'category', Category with id: #{record.value} should exist.")
    end
  end
end
