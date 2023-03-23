class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ edit update destroy ]

  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end

  def edit
  end

  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to deliveries_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @delivery.update(delivery_params)
      redirect_to deliveries_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @delivery.destroy
    redirect_to deliveries_path, notice: t('.deleted'), status: :see_other
  end

  private
    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    def delivery_params
      params.require(:delivery).permit(:quantity, :observation)
    end
end
