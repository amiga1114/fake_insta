class UsersController < ApplicationController
  def index

  end

  def signup

  end

  def register
    @email = params[:email]
    @password = params[:password]
    User.create(
      :email => params[:email],
      :password => params[:password]
    )
  end

  def list
    @list = User.all.reverse
  end
end
