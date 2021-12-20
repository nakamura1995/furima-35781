class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show, :require_login]
 #before_action :set_item, only: [:show, :edit, :update]
  
   def index
    #@items = Item.all
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
  params.require(:item).permit( :image, :name, :category_id, :price, :explanation_id, :status_id, :days_id, :description, :prefectures_id, :user_id).merge(user_id: current_user.id)
end

def move_to_index
  redirect_to new_user_session_path unless user_signed_in?
end

# def set_item
#   @items = Item.find(params[:id])
# end

end