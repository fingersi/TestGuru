class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :user_histories
  has_many :questions

  def self.find_by_category(category)
    Test.joins(:category)
        .where('categories.title = ?', category)
        .order('tests.title DESC').pluck(:title)
  end
end
