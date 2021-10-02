class User < ApplicationRecord
  has_many :user_histories
  has_many :tests, through: :user_histories

  def history(level)
    Test.joins(:users).where('tests.level = ? AND user_id = ?', level, id)
  end
end
