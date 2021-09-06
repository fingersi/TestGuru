class User < ApplicationRecord
  def history(level)
    Test.joins(
      'INNER JOIN user_histories ON tests.id = user_histories.test_id'
    ).where(
      'user_histories.level = ? AND user_histories.user_id = ?', level, id
    )
  end
end
