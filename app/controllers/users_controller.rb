class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


def index
  @user = User.all
  end

def show
  @user = User.find_by(id: params[:id])
end

def edit
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end
end

