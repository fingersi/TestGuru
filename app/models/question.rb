class Question < ApplicationRecord
  has_many :answers
  belongs_to :test

  validates :body, presence: true
  validates :answers, length: { minimum: 1, maximum: 4 }
end
