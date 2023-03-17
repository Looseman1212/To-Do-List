class ItemsController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @list = List.find(params[:list_id])
    @item.list = @list
    if @item.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    @list = @item.list
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    @list = @item.list
    if @item.save!
      redirect_to list_path(@list)
    else
      render new, status: :unprocessable_entity
    end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

    redirect_to list_path(@item.list)
  end

  private

  def item_params
    params.require(:item).permit(:name, :content)
  end
end
