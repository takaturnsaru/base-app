require 'rails_helper'

describe Admin, type: :model do
  before do
    @admin = FactoryBot.build(:admin)
  end


  describe "管理者新規登録" do
    context "新規登録がうまくいくとき" do
      it "nameとemail,password,password_confirmationが存在すれば登録できる" do
        expect(@admin).to be_valid
      end
      it "nameが存在すれば登録できる" do
        @admin.name = "eeeee"
        expect(@admin).to be_valid
      end
      it "emailが存在すれば登録できる" do
        @admin.email = "uuuuu@iii.com"
        expect(@admin).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @admin.password = "qqqqqqq"
        @admin.password_confirmation = "qqqqqqq"
        expect(@admin).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nameが空だと登録できない" do
        @admin.name = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("名前が入力されていません。")
      end
      it "emailが空だと登録できない" do
        @admin.email = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("メールアドレスが入力されていません。")
      end
      it "emailが重複していると登録できない" do
        @admin.save
        another_admin = FactoryBot.build(:admin)
        another_admin.email = @admin.email
        another_admin.valid?
        expect(another_admin.errors.full_messages).to include("メールアドレスは既に使用されています。")
      end
      it "passwordが空だと登録できない" do
        @admin.password = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("パスワードが入力されていません。")
      end
      it "passwordが5文字以下だと登録できない" do
        @admin.password = "wwwww"
        @admin.valid?
        expect(@admin.errors.full_messages).to include("パスワードは6文字以上に設定して下さい。")
      end
      it "passwordが存在してもpassword_confirmationが空だと登録できない" do
        @admin.password_confirmation = ""
        @admin.valid?
        expect(@admin.errors.full_messages).to include("確認用パスワードが内容とあっていません。")
      end
    end
  end
end
