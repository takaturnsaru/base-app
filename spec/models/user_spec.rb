require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "ユーザー新規登録" do
    context "新規登録がうまくいくとき" do
      it "nameとemail,password,password_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "nameが存在すれば登録できる" do
        @user.name = "eeeee"
        expect(@user).to be_valid
      end
      it "emailが存在すれば登録できる" do
        @user.email = "uuuuu@iii.com"
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "qqqqqqq"
        @user.password_confirmation = "qqqqqqq"
        expect(@user).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nameが空だと登録できない" do
        @user.name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("名前が入力されていません。")
      end
      it "emailが空だと登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("メールアドレスが入力されていません。")
      end
      it "emailが重複していると登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスは既に使用されています。")
      end
      it "passwordが空だと登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードが入力されていません。")
      end
      it "passwordが5文字以下だと登録できない" do
        @user.password = "wwwww"
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("確認用パスワードが内容とあっていません。")
      end
    end
  end
end
