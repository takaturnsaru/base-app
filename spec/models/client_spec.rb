require 'rails_helper'

describe Client, type: :model do
  before do
    @client = FactoryBot.build(:client)
  end

  describe "顧客新規登録" do
    context "新規登録うまくいくとき" do
      it "全てが入力されているとき" do
        expect(@client).to be_valid
      end
      it "nameが存在すれば登録できる" do
        @client.name = "abe"
        expect(@client).to be_valid
      end
      it "postal_codeが存在すれば登録できる" do
        @client.postal_code = "978-1143"
        expect(@client).to be_valid
      end
      it "prefectures_idが０じゃなければ登録できる" do
        @client.prefectures_id = 2
        expect(@client).to be_valid
      end
      it "cityが存在すれば登録できる" do
        @client.city = "新潟市東区"
        expect(@client).to be_valid
      end
      it "addressが存在すれば登録できる" do
        @client.address = "2-2-2"
        expect(@client).to be_valid
      end
      it "phone_numberが存在すれば登録できる" do
        @client.phone_number = "09012334566"
        expect(@client).to be_valid
      end
    end

    context "登録がうまくいかないとき" do
      it"nameが空の場合登録できない" do
        @client.name = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("名前が入力されていません。")
      end
      it"postal_codeがからの場合登録できない" do
        @client.postal_code =""
        @client.valid?
        expect(@client.errors.full_messages).to include("郵便番号が入力されていません。")
      end
      it "prefectures_idが０の場合登録できない" do
        @client.prefectures_id = 0
        @client.valid?
        expect(@client.errors.full_messages).to include("都道府県を選択してください")
      end
      it "cityが空の場合登録できない" do
        @client.city = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("市区町村が入力されていません。")
      end
      it "addressが空の場合登録できない" do
        @client.address = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("番地が入力されていません。")
      end
      it "phone_numberが空の場合登録できない" do
        @client.phone_number = ""
        @client.valid?
        expect(@client.errors.full_messages).to include("電話番号が入力されていません。")
      end
      it "phone_numberが12文字以上だと登録できない" do
        @client.phone_number = "090123456789"
        @client.valid?
        expect(@client.errors.full_messages).to include("電話番号は11文字以下に設定して下さい。")
      end
    end
  end
end
