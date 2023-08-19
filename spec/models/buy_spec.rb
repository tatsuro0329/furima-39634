require 'rails_helper'

RSpec.describe Buy, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @buy = FactoryBot.build(:buy, user_id: user.id, item_id: item.id)
    sleep(1)
  end

  describe '商品購入機能' do

    context '購入できる場合' do
      it '全項目正しければ購入できる' do
      expect(@buy).to be_valid
      end

      it '建物名が空でも購入できる' do
      @buy.building_name = nil
      expect(@buy).to be_valid
      end
    end


    context '購入できない場合' do
      it 'user_idが空だと登録できない' do
      @buy.user_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("User can't be blank")
      end
      
      it 'item_idが空だと登録できない' do
      @buy.item_id = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが存在しない場合' do
      @buy.token = nil
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Token can't be blank")
      end
      it 'post_codeが存在しない場合' do
      @buy.post_code = nil
      @buy.valid?  
      expect(@buy.errors.full_messages).to include("Post code can't be blank")
      end
      it 'sender_idが存在しない場合' do
      @buy.sender_id = nil
      @buy.valid?  
      expect(@buy.errors.full_messages).to include("Sender can't be blank")
      end
      it 'municipalitiesが存在しない場合' do
      @buy.municipalities = nil
      @buy.valid?  
      expect(@buy.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'house_numberが存在しない場合' do
      @buy.house_number = nil
      @buy.valid?  
      expect(@buy.errors.full_messages).to include("House number can't be blank")
      end
      it 'telが存在しない場合' do
      @buy.tel = nil
      @buy.valid?  
      expect(@buy.errors.full_messages).to include("Tel can't be blank")
      end
      it 'post_codeが数字のみの7桁の場合' do
      @buy.post_code = '1234567'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'post_codeが4桁-3桁の形式の場合' do
      @buy.post_code = '1234-567'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'telが9桁以下では登録できないこと' do
      @buy.tel = '012345678'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Tel must be 10 or 11 digits')
      end
      it 'telが12桁以上では登録できないこと' do
      @buy.tel = '012345678901'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Tel must be 10 or 11 digits')
      end
      it 'telが半角数値でない場合' do
      @buy.tel = '01234abcd5'
      @buy.valid?
      expect(@buy.errors.full_messages).to include('Tel must be 10 or 11 digits')
      end
      it 'sender_idが1の場合' do
      @buy.sender_id = 1
      @buy.valid?
      expect(@buy.errors.full_messages).to include("Sender can't be blank")
      end
    end
  end
end