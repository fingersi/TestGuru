class User < ApplicationRecord

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_many :test_passings
  has_many :tests, through: :test_passings 
  has_many :gists
  

  def history(level)
    Test.joins(:users).where('tests.level = ? AND user_id = ?', level, id)
  end

  def admin?
    is_a?(Admin)
  end

  def full_name
    first_name + last_name
  end
end
