class TestPassing < ApplicationRecord

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_save_set_first_question, on: :create

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if check_answers?(answer_ids)
      self.correct_questions += 1
    end

    self.current_question = next_question
    save!
  end

  private

  def before_save_set_first_question
    self.current_question = test.questions.first
  end

  def check_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def next_question
    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end