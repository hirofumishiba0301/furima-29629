require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'nickname,last_name,first_name,last_name_kana,first_name_kana,birthdayとemail,passwordとpassword_confirmationが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'last_nameが空では登録できないこと' do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_nameが空では登録できないこと' do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが半角では登録できないこと' do
      @user.last_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end

    it 'first_nameが半角では登録できないこと' do
      @user.first_name = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_name_kanaが半角では登録できないこと' do
      @user.last_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが半角では登録できないこと' do
      @user.first_name_kana = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが平仮名では登録できないこと' do
      @user.last_name_kana = "ほげ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが平仮名では登録できないこと' do
      @user.first_name_kana = "ほげ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが漢字では登録できないこと' do
      @user.last_name_kana = "帆花"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'first_name_kanaが漢字では登録できないこと' do
      @user.first_name_kana = "帆花"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaが空では登録できないこと' do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_name_kanaが空では登録できないこと' do
      @user.first_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'emailが空では登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailに@が含まれていなければ登録できないこと' do
      @user.email = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'birthdayが空では登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'passwordが6文字以上であれば登録できること' do
      @user.password = '000000a'
      @user.password_confirmation = '000000a'
      expect(@user).to be_valid
    end

    it 'passwordが5文字以下では登録できないこと' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end

    it 'passwordが英字だけでは登録できないこと' do
      @user.password = 'aaaaaaa'
      @user.password_confirmation = 'aaaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '1111111'
      @user.password_confirmation = '1111111'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end

    it '重複したemailが存在する場合は登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
  end
end
