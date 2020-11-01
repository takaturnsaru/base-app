require 'rails_helper'

describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end
  
  describe "製品の新規登録ができるとき" do
    context "新規登録がうまくいくとき" do
      it "nameが存在すれば登録できる" do
        @product.name = "iii"
        expect(@product).to be_valid
      end
      it "grade_idが0でなければ登録できる" do
        @product.grade_id = 2
        expect(@product).to be_valid
      end
      it "priceが存在すれば登録できる" do
        @product.price = "2000000"
        expect(@product).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nameが空の場合登録できない" do
        @product.name = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("名前が入力されていません。")
      end
      it "grade_idが0の場合登録できない" do
        @product.grade_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("仕様を選択してください。")
      end
      it "priceがからの場合登録できない" do
        @product.price = ""
        @product.valid?
        expect(@product.errors.full_messages).to include("価格が入力されていません。")
      end
    end
  end
end
