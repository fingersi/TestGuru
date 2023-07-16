class Category < ApplicationRecord
  has_many :tests
  has_and_belongs_to_many :badges, dependent: :destroy

  default_scope { order(title: :desc) }
end
