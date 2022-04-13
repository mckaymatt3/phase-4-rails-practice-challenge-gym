class ClientsController < ApplicationController
    before_action :set_client, only: [:show]

    def index
        # byebug
        @clients = Client.all
        render json: @clients
    end

    def show
        render json: @client
    end

    # could create below similar to memberships set up and then update the routes to include all
    # def create
        
    # end

    # def update
        
    # end

    # def destroy
        
    # end

    private

    def client_params
        params.permit(:name, :age, :memberships)
    end

    def set_client
        @client = Client.find(params[:id])
    end

end
