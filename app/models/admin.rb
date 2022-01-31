class Admin < User
  has_many :created_test, class_name: :Test, foreign_key: :author_id
end
