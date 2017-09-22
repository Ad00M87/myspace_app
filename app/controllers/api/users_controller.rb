class Api::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    @user = User.find(params[:id])
  end
end
