class Test < ApplicationRecord
  belongs_to :category
  has_many :test_passing
  has_many :users, through: :test_passing
  belongs_to :author, class_name: 'User'
  has_many :questions

  scope :by_level, ->(lev) { where(level: lev) }
  scope :easy, -> { by_level(0..1) }
  scope :moderate, -> { by_level(2..4) }
  scope :advance, -> { by_level(4..Float::INFINITY) }
  scope :find_by_category, ->(category) { Test.joins(:category).where('categories.title = ?', category) }

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { other_than: 0 }
  validate :published, :check_question

  before_destroy :destroy_associations

  def self.find_order_by_category(category)
    Test.find_by_category(category).order('tests.title DESC').pluck(:title)
  end

  def self.for_users
    Test.where(published: true)
  end

  def check_question
    if published && fullfilled?

      errors.add :fullfilled, :no_question_answers, message: I18n.t('.cannot_publish_no_question_or_answer')
      return false
    end
    true
  end

  def fullfilled?
    return false unless questions.present?

    return false unless Question.answers?(questions)

    true
  end

  def destroy_associations
    Test.transaction do 
      test_passing.destroy_all
      questions.destroy_all
    end
  end
end
