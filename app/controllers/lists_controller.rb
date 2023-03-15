class ListsController < ApplicationController
  def index
    return unless user_signed_in?

    @user = current_user
    @lists = List.where(user_id: @user.id)
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to lists_path
  end

  def show
    @list = List.find(params[:id])
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy

    redirect_to root_path
  end

  private

  def list_params
    params.require(:list).permit(:name).merge(user_id: current_user.id)
  end
end
