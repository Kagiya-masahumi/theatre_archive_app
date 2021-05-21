require 'rails_helper'

RSpec.describe Group, type: :model do
  before do
    @group = FactoryBot.build(:group)
    
  end




  describe "新規登録" do
    context '団体の新規登録ができる時' do 
      it '登録に必要な情報が存在すれば登録できること' do
        expect(@group).to be_valid
      end

      it ' パスワードは、半角英数字混合での入力であれば登録ができること' do
        @group.password = '1a2b3c'
        @group.password_confirmation = '1a2b3c'
        expect(@group).to be_valid
      end

      it '団体名は、入力があれば登録できること' do
        @group.name = 'たろう'
        expect(@group).to be_valid
      end

    end


    context '団体登録できない時' do

      it '団体名が空では登録できないこと' do
        @group.name = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Name can't be blank")
      end

      it 'メールアドレスが空では登録できないこと' do
        @group.email = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Email can't be blank")
      end

      it 'メールアドレスが一意性でなければ登録できないこと' do
        @group.save
        another_user = FactoryBot.build(:group, email:@group.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it 'メールアドレスは、@を含めなければ登録できないこと' do
        @group.email = 'test.sample'
        @group.valid?
        expect(@group.errors.full_messages).to include("Email is invalid")
      end

      it 'パスワードが空では登録できないこと' do
        @group.password = ''
        @group.valid?
        expect(@group.errors.full_messages).to include("Password can't be blank")
      end

      it 'パスワードは、6文字以上での入力でなければ登録できないこと' do
        @group.password = '1a2b3'
        @group.password_confirmation = '1a2b3'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it ' パスワードは、半角英数字混合での入力でなければ登録できないこと' do
        @group.password = '111111'
        @group.password_confirmation = '111111'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end

      it ' パスワードは、英語のみでは登録できないこと' do
        @group.password = 'aaaaaaa'
        @group.password_confirmation = 'aaaaaaa'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end

      it ' パスワードは、数字のみでは登録できないこと' do
        @group.password = '111111'
        @group.password_confirmation = '111111'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end

      it ' パスワードは、全角では登録できないこと' do
        @group.password = '１Ａ２Ｂ３Ｃ'
        @group.password_confirmation = '１Ａ２Ｂ３Ｃ'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password は6文字以上かつ英数字をそれぞれ含めてください")
      end

      it 'パスワードは、確認用を含めて2回入力しなければ登録できないこと' do
        @group.password = ''
        @group.password_confirmation = '1a2b3c'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password confirmation doesn't match Password")
      end


      it 'パスワードとパスワード(確認用)の値の一致が必須であること' do
        @group.password = '123456'
        @group.password_confirmation = '1a2b3c'
        @group.valid?
        expect(@group.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "劇団のロゴが未選択だと登録できない" do
        @group.image  = nil
        @group.valid?
        expect(@group.errors.full_messages).to include("Image can't be blank")
      end
    end
  end
end
