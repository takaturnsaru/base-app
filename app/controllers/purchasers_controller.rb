class PurchasersController < ApplicationController
  before_action :move_to_root

  def new
    @purchaser = Purchaser.new
    @client = Client.find(params[:client_id])
  end
  
  def create
    @client = Client.find(params[:client_id])
    @purchaser = Purchaser.new(purchaser_params)
    if @purchaser.valid?
      @purchaser.save
      redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
    @client = Client.find(params[:client_id])
    @purchaser = Purchaser.find(params[:id])
  end
  
  def update
    @client = Client.find(params[:client_id])
    @purchaser = Purchaser.find(params[:id])
    @purchaser.update(purchaser_params)
    if @purchaser.valid?
      redirect_to client_path(@client)
    else
      render :edit
    end
  end

  def destroy
    @client = Client.find(params[:client_id])
    purchaser = Purchaser.find(params[:id])
    purchaser.destroy
    redirect_to client_path(@client)
  end



  private

  def purchaser_params
    params.require(:purchaser).permit(:buyday,:product_specification_id,:unit_price,:quanity,:amount).merge(client_id:params[:client_id])
  end

  def move_to_root
    unless user_signed_in?
      redirect_to root_path
    end
  end
end
