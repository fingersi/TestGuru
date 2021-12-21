class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passings
  belongs_to :test

  validates :body, presence: true
end
