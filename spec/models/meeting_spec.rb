require 'rails_helper'

describe Meeting, type: :model do
  before do
    @meeting = FactoryBot.build(:meeting)
  end

  describe "スケジュールの新規登録" do
    context "新規登録がうまくいくとき" do
      it "nameとstart_time,textが存在すれば予定は登録される。" do
        expect(@meeting).to be_valid
      end
      it "nameが存在すれば登録される" do
        @meeting.name = "訪問する"
        expect(@meeting).to be_valid
      end
      it "stat_timeが存在すれば登録できる" do
        @meeting.start_time = "2030/10/30"
        expect(@meeting).to be_valid
      end
      it "textが存在すれば登録できる" do
        @meeting.text = "ddddddddddddddddddddddddddddddddddddddddd"
        expect(@meeting).to be_valid
      end
    end

    context "新規登録がうまくいかないとき" do
      it "nameが空の時登録されない" do
        @meeting.name = ""
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("予定が入力されていません。")
      end
      it "start_timeが空だと登録できない" do
        @meeting.start_time = ""
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("日付が入力されていません。")
      end
      it "textが空だと登録できない" do
        @meeting.text = ""
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include("詳細が入力されていません。")
      end
    end
  end
end
