class UsersController < ApplicationController
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :confirmable
end
