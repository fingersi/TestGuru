class UsersController < ApplicationController
  extend Devise::Models

  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :confirmable
end
