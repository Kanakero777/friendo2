class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
  end

  def search
  end

  def detail
    @detail = User.find(params[:id])
  end
end
