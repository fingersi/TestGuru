class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_many :test_passing
  has_and_belongs_to_many :categories
  belongs_to :image, optional: true
  has_and_belongs_to_many :test_passings

  scope :all_activated, -> { where(activated: true) }

  def picture_path
    image&.picture_path
  end
end
