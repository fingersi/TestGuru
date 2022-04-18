class Gist < ApplicationRecord

  belongs_to :question
  belongs_to :user

  validates_format_of :link, with: /gist.github.com/
end
