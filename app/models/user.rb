class User < ApplicationRecord
  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :created_test, class_name: :Test, foreign_key: :author_id

  validates :email, presence: true

  def history(level)
    Test.joins(:users).where('tests.level = ? AND user_id = ?', level, id)
  end
end
