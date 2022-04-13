class GymsController < ApplicationController
    before_action :set_gym, only: [:show]

    def index
        @gyms = Gym.all
        render json: @gyms
    end

    def show
        render json: @gym
    end

    # could create below similar to memberships set up and then update the routes to include all
    # def create
    # end

    # def update
    # end

    # def destroy
    # end

    private

    def gym_params
        params.permit(:name, :address)
    end

    def set_gym
        @gym = Gym.find(params[:id])
    end
    
end
