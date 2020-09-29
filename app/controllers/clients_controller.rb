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
  

  private

    def client_params
      params.permit(:name, :postal_code, :prefectures_id, :city, :address, :building_name, :phone_number)
    end
  
end
