require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '入力条件を満たせば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '12345'
        @user.password_confirmation = '12345'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = '123456a'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'パスワードは数字のみでは登録できない' do
        @user.password = '123456' # 数字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain both letters and numbers')
      end

      it 'パスワードは半角英数字のみでは登録できない' do
        @user.password = 'abcdef' # 英字のみのパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain both letters and numbers')
      end

      it 'パスワードは全角では登録できない' do
        @user.password = 'パスワード' # 日本語のパスワード
        @user.valid?
        expect(@user.errors.full_messages).to include('Password must contain both letters and numbers')
      end

      it 'last_name(全角)の入力が必須であること' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name(全角)の入力が必須であること' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name(全角)は半角英字のみでは登録できない' do
        @user.last_name = 'Smith' # 半角文字
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'last_name(全角)は数字のみでは登録できない' do
        @user.last_name = '123456' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end

      it 'first_name(全角)は半角英字のみでは登録できない' do
        @user.first_name = 'John' # 半角文字
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'first_name(全角)は数字のみでは登録できない' do
        @user.first_name = '123456' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end

      it 'last_name_kana(全角)の入力が必須であること' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kana(全角)の入力が必須であること' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kana(全角)は半角英字のみでは登録できない' do
        @user.last_name_kana = 'Smith' # 半角文字
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'last_name_kana(全角)は数字のみでは登録できない' do
        @user.last_name_kana = '123456' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana is invalid')
      end

      it 'first_name_kana(全角)は半角英字のみでは登録できない' do
        @user.first_name_kana = 'John' # 半角文字
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it 'last_name_kana(全角)は数字のみでは登録できない' do
        @user.first_name_kana = '123456' # 数字のみ
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana is invalid')
      end

      it '生年月日が空では登録できない' do
        @user.date_of_birth = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end
    end
  end
end
