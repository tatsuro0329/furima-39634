class ItemsController < ApplicationController
  before_action :move_to_log_in, only: [:new]

  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  # def show
  # end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def destroy
  # end

  # def edit
  # end

  # def update
  # end

  private
  def move_to_log_in
    unless user_signed_in?
      redirect_to "/users/sign_in"
    end
  end

  def item_params
    params.require(:item).permit(:image, :title, :text, :category_id, :condition_id, :delivery_charge_id, :sender_id, :days_to_ship_id, :price).merge(user_id: current_user.id)
  end

end
