class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show]
  

  def index
    @items = Item.order('created_at DESC')
     end

  def new
    @item = Item.new
  end

  def show  
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :category_id, :price, :explanation_id, :status_id, :day_id, :description,
                                 :prefecture_id).merge(user_id: current_user.id)
  end
end
