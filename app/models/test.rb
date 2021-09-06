class Test < ApplicationRecord
  def self.find_by_category(category)
    Test.joins(
      'INNER JOIN categories ON tests.category_id = categories.id'
    ).where(
      'categories.title = ?', category
    ).order(
      'tests.title DESC'
    )
  end
end
