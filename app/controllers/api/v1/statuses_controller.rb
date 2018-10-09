class Api::V1::StatusesController < ApplicationController
  before_action :set_status, only: [:show, :update, :destroy]

  def index
    @statuses = Status.all
    json_response @statuses
  end

  def create
    @status = Status.create(status_params)

    json_response @status, :created
  end

  def show
    json_response @status
  end

  def destroy
    @status.destroy

    head :no_content
  end

  def update
    @status.update_attributes(status_params)

    json_response @status
  end

  private

    def set_status
      @status = Status.find(params[:id])
    end

    def status_params
      params.require(:status).permit(:id, :description)
    end
end
