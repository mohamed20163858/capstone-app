class UsersController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:index]
  before_action :home, only: [:index]
  def index; end

  def show
    @user = User.find_by(id: params[:user_id].to_i)
    @current_user = current_user
  end

  def home
    redirect_to user_path(current_user) if user_signed_in?
  end
end
