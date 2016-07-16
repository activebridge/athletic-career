class UsersController < ApplicationController
  expose :users, -> { User.all }
  expose :user
end
