class HomeController < ApplicationController

  def index

    @containers = Container.includes(:container_items)

    render json: @containers
  end
end