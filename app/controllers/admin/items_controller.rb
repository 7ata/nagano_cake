class Admin::ItemsController < ApplicationController
  def index
    @item = Item.new
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    if @item.save
  		redirect_to admin_items_path(@item.id), notice: "Item was successfully created."
    else
      @items = Item.all
      render :index
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
  end

  private
  def item_params
    params.require(:item).permit(:id,:genre_id,:name,:introduction,:price,:is_active)
  end
end
