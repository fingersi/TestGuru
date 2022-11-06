class User < ApplicationRecord 

  def self.find_sti_class(type_name)
    return User if type_name.to_s == 'User'
    return Admin if type_name.to_s == 'Admin'
  end

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
