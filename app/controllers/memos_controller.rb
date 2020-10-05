class MemosController < ApplicationController
  def index
    @memos = Memo.all
  end

  def create
    @memo.create(:memo_params[:memo])
    render json:{memo: memo}
  end

end
