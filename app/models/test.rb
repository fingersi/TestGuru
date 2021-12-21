class Test < ApplicationRecord
  belongs_to :category
  has_many :user_histories
  has_many :users, through: :test_passing
  belongs_to :author, class_name: 'User'
  has_many :questions

  scope :by_level, ->(lev) { where(level: lev) }
  scope :easy, -> { by_level(0..1) }
  scope :moderate, -> { by_level(2..4) }
  scope :advance, -> { by_level(4..Float::INFINITY) }
  scope :find_by_category, ->(category) { Test.joins(:category).where('categories.title = ?', category) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { other_than: 0 }

  def self.find_order_by_category(category)
    Test.find_by_category(category).order('tests.title DESC').pluck(:title)
  end
end
