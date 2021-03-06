class ClientsController < ApplicationController
  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
      @client.save
      redirect_to clients_path
    else
      render :new
    end
  end

  def show
    @client = Client.find(params[:id])
    @purchasers = @client.purchasers.includes(:client)
  end

  def edit
    @client = Client.find(params[:id]) 
  end

  def update
    @client = Client.find(params[:id])
    @client.update(client_params)
    if @client.valid?
      redirect_to client_path
    else
      render :edit
    end
  end


  private

    def client_params
      params.require(:client).permit(:name, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number)
    end
    
    def move_to_index
      unless user_signe_in?
        redirect_to action meetings_path
      end
    end
end
