class ItemsController < ApplicationController
   def index
    
  end

def new
  @item = Item.new
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
  #params.require(:item).permit(:category_id, :days_id, :prefectures_id, :explanation_id, :status_id, :user_id :image)
end
end