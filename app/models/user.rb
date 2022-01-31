class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passings
  has_many :tests, through: :test_passings

  def history(level)
    Test.joins(:users).where('tests.level = ? AND user_id = ?', level, id)
  end
end
