class MembershipsController < ApplicationController
    before_action :set_membership, only: [:show, :update, :destroy]
    rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity_error
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found_error

    def index
        @memberships = Membership.all
        render json: @memberships
    end

    def show
        render json: @membership
    end

    def create
        @new_membership = Membership.create(membership_params)
        # binding.pry
        if @new_membership.save
            render json: @new_membership, status: :created, location: @new_membership
        else
            # binding.pry
            render json: @new_membership.errors.full_messages, status: :unprocessable_entity
        end
    end

    def update
        if @membership.update(membership_params)
            render json: @membership, status: :ok
        else
            render json: @membership.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy
        @membership.destory
    end

    private

    def membership_params
        params.permit(:charge, :gym_id, :client_id)
    end

    def set_membership
        @membership = Membership.find(params[:id])
    end

    def unprocessable_entity_error
        render json: @membership.errors.full_messages, status: :unprocessable_entity
    end

    def record_not_found_error
        render json: { error: "Membership not found" }, status: :not_found
    end


end
