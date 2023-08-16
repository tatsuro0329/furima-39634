class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy]
  before_action :move_to_log_in, only: [:new, :edit]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :not_sign_in_actionm, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
  def move_to_log_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :delivery_charge_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def not_sign_in_action
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

end