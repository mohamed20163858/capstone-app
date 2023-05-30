class GroupsController < ApplicationController
  before_action :authenticate_user!
  def index; end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.author = current_user
    respond_to do |format|
      if @group.save
        format.html { redirect_to "/user/#{current_user.id}/home" }
      else
        format.html { render '/categories/new' }
      end
    end
  end

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
