class TestPassing < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true
  has_and_belongs_to_many :badges

  before_create :before_save_set_first_question
  before_update :before_update_next_question

  SUCCESS_LEVEL = 85

  def completed?
    return true if current_question.nil?

    false
  end

  def issue_badge
    BadgeFinder.new(self).find_badge
  end

  def tag_successfull
    self.successfull = true if successfull?
    save!
  end

  def mark
    (correct_questions.to_f / total_questions) * 100
  end

  def progress
    ((current_question_number.to_f / total_questions) * 100).to_i
  end

  def current_question_number
    total_questions - self.test.questions.order(:id).where('id > ?', current_question.id).count
  end

  def total_questions
    test.questions.count
  end

  def successfull?
    mark >= SUCCESS_LEVEL
  end

  def accept!(answer_ids)
    self.correct_questions += 1 if check_answers?(answer_ids)

    save!
  end

  private

  def before_save_set_first_question
    self.current_question = test.questions.first if test.questions.first.present?
  end

  def check_answers?(answer_ids)
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct_answers
  end

  def before_update_next_question
    self.current_question = test.questions.order(:id).where('id > ?', current_question.id).first unless successfull
  end
end
