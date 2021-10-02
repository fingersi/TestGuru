class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :user_histories

  def self.find_by_category(category)
    Test.joins(:category)
        .where('categories.title = ?', category)
        .order('tests.title DESC')
  end
end
