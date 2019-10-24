class ContainerItemsController < ApplicationController
  before_action :set_container_item, only: [:show, :update, :destroy]

  # GET /container_items
  def index
    @container_items = ContainerItem.all

    render json: @container_items
  end

  # GET /container_items/1
  def show
    render json: @container_item
  end

  # POST /container_items
  def create
    @container_item = ContainerItem.new(container_item_params)

    if @container_item.save
      render json: @container_item, status: :created, location: @container_item
    else
      render json: @container_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /container_items/1
  def update
    if @container_item.update(container_item_params)
      render json: @container_item
    else
      render json: @container_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /container_items/1
  def destroy
    @container_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_container_item
      @container_item = ContainerItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def container_item_params
      params.require(:container_item).permit(:user_id, :parent_id, :name)
    end
end
