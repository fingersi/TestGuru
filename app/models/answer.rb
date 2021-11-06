class Answer < ApplicationRecord
  belongs_to :question

  scope :correct_answers, -> { where(correct: true) }

  validate :validate_number_answers_in_question

  def validate_number_answers_in_question
    errors.add(:question_id, 'Question has too many answers') if question.answers.length > 4
  end
end
