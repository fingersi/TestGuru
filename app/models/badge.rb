class Badge < ApplicationRecord
  has_many :users, through: :user_badges
  has_and_belongs_to_many :test_passings

  validates :condition, inclusion: { in: %w[category first_time level],
                                     message: ' value should be only: category, first_time, level.' }
  validates :title, presence: true
  validates :picture_path, presence: true
  validates_with BadgeValidator

  scope :all_activated, -> { where(activated: true) }
end
