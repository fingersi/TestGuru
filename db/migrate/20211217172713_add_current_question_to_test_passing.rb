class AddCurrentQuestionToTestPassing < ActiveRecord::Migration[6.1]
  def change
    add_reference :test_passings, :current_question, foreigh_key: { to_table: :questions }
    add_column :test_passings, :correct_questions, :integer, default: 0
  end
end