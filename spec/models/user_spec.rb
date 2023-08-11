require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
    it "nickname,email,password,password_confirmation,last_name,first_name,last_name_kana,first_name_kana,birth_dayが存在すれば登録できる" do
      expect(@user).to be_valid
    end

    context '新規登録できない場合' do
    it 'nicknameが空では登録できない' do
      user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end
    it 'emailが空では登録できない' do
      user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user.last_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'frist_nameが空では登録できない' do
      user.first_name = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
    end
    it 'frist_name_kanaが空では登録できない' do
      user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
    it 'birth_dayが空では登録できない' do
      user.birth_day = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth_day can't be blank")
    end
    it 'last_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      user.last_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name can't be blank")
    end
    it 'frist_nameは全角（漢字・ひらがな・カタカナ）以外では登録できない' do
      user.frist_name = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name can't be blank")
    end
    it 'last_name_kanaは全角（カタカナ）以外では登録できない' do
      user.last_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last_name_kana can't be blank")
    end
    it 'frist_name_kanaは全角（カタカナ）以外では登録できない' do
      user.frist_name_kana = "suzuki"
      @user.valid?
      expect(@user.errors.full_messages).to include("First_name_kana can't be blank")
    end
  end
end