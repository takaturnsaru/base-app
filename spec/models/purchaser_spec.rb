require 'rails_helper'

describe Purchaser, type: :model do
  before do
    @purchaser = FactoryBot.build(:purchaser)
  end

  describe "購入機能新規登録" do
    context "新規登録がうまくいくとき" do
      it "全て入力されていれば登録できる" do
        expect(@purchaser).to be_valid
      end
      it "product_specification_idが0じゃなければ登録できる" do
        @purchaser.product_specification_id = 3
        expect(@purchaser).to be_valid
      end
      it "unit_priceが存在すれば登録できる" do
        @purchaser.unit_price = "2000000"
        expect(@purchaser).to be_valid
      end
      it "quanityが存在すれば登録できる" do
        @purchaser.quanity = "2"
        expect(@purchaser).to be_valid
      end
      it "amountが存在すれば登録できる" do
        @purchaser.amount = "30000000"
        expect(@purchaser).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "product_specification_idが0だと登録できない" do
        @purchaser.product_specification_id = 0
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("製品・仕様を選択してください。")
      end
      it "unit_priceが空だと登録できない" do
        @purchaser.unit_price = ""
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("単価が入力されていません。")
      end
      it "quanityが空だと登録できない" do
        @purchaser.quanity = ""
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("数量が入力されていません。")
      end
      it "amountが空だと登録できない" do
        @purchaser.amount = ""
        @purchaser.valid?
        expect(@purchaser.errors.full_messages).to include("合計が入力されていません。")
      end
    end
  end
end
