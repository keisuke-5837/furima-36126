class UsersController < ApplicationController
  def create
   @user = User.new
    if @user.save
      redirect_to root_path(@user)
    else
      render :new
    end
  end

end
