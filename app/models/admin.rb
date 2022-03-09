class Admin < User
  has_many :created_tests, class_name: :Test, foreign_key: :author_id
end
