class ExchangesController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find_by(id: params[:user_id].to_i)
    @group = Group.find_by(id: params[:group_id].to_i)
    @current_user = current_user
  end

  def new
    @exchange = Exchange.new
    @group = Group.find_by(id: params[:group_id].to_i)
  end

  def create
    @exchange = Exchange.new(exchange_params)
    @exchange.author = current_user
    main_group = Group.find_by(id: params[:group_id].to_i)
    @exchange.groups.append(main_group) unless @exchange.groups.include?(main_group)
    group_ids = params[:group_ids]
    group_ids&.each do |group_id|
      group = Group.find_by(id: group_id.to_i)
      @exchange.groups.append(group) unless @exchange.groups.include?(group)
    end
    respond_to do |format|
      if @exchange.save
        format.html { redirect_to "/user/#{current_user.id}/transactions/#{main_group.id}" }
      else
        format.html { render "/transactions/new/#{main_group.id}" }
      end
    end
  end

  def exchange_params
    params.require(:exchange).permit(:name, :amount)
  end
end
