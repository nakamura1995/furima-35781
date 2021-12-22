class ItemsController < ApplicationController
  
  before_action :authenticate_user!, except: :index
  
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
  params.require(:item).permit( :image, :name, :category_id, :price, :explanation_id, :status_id, :days_id, :description, :prefectures_id).merge(user_id: current_user.id)
end




end