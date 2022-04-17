class Gist < ApplicationRecord
  require 'uri'

  belongs_to :question
  belongs_to :user

  validates_format_of :link, with: /gist.github.com/
end
