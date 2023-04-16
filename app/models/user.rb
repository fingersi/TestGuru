class User < ApplicationRecord 

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :test_passings
  has_many :tests, through: :test_passings
  has_many :gists
  has_many :user_badges
  has_many :badges, through: :user_badges

  def create
    self.type = 'User'
  end

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
