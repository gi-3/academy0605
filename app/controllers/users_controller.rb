class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @ently = @user.entlies.last
  end

end
