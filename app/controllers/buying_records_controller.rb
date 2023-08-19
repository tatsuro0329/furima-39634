class BuyingRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_item, only: [:index, :create]
  before_action :ensure_not_seller, only: [:index]
  before_action :ensure_not_sold, only: [:index]

  def index
    if current_user.id == @item.user_id
      redirect_to root_path
      return
    end
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @buy = Buy.new
  end
  
  def create
    @buy = Buy.new(buying_record_params)
    if @buy.valid?
      buy_item
      @buy.save
      return redirect_to root_path
    else
      render 'index', status: :unprocessable_entity
    end
  end

  private

  def buying_record_params
    params.require(:buy).permit(:post_code, :sender_id, :municipalities, :house_number, :building_name, :tel).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def buy_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    item = Item.find(params[:item_id])
    Payjp::Charge.create(
      amount: item.price,
      card: buying_record_params[:token],
      currency: 'jpy'
    )
  end

  def ensure_not_seller
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def ensure_not_sold
    if @item.buying_record.present?
      redirect_to root_path
    end
  end
  
  def set_item
    @item = Item.find(params[:item_id])
  end

end