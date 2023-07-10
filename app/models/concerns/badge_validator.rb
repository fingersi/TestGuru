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

  def category_validation(record)
    if record.value.empty?
      record.errors.add(:value, "If Condition = 'condition', value should be set.")

      return
    end

    return unless Category.where(title: record.value).empty?

    record.errors.add(:value, "If Badge Condition: 'category', Category with id: #{record.value} should exist.")
  end
end
