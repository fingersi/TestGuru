class Question < ApplicationRecord
  has_many :answers, dependent: :destroy
  has_many :test_passings
  has_many :gists
  belongs_to :test

  validates :body, presence: true

  def self.answers?(questions)
    return false if questions.empty?

    questions.each do |question|
      return false if question.answers.empty?
    end
    true
  end

  def fullfilled?
    answers.present?
  end
end
