class DeliveriesController < ApplicationController
  def index
    @deliveries = Delivery.all
  end

  def new
    @delivery = Delivery.new
  end

  def create
    @delivery = Delivery.new(delivery_params)

    if @delivery.save
      redirect_to deliveries_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    delivery
  end

  def update
    if delivery.update(delivery_params)
      redirect_to deliveries_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    delivery.destroy

    redirect_to deliveries_path, notice: t('.deleted'), status: :see_other
  end

  private

  def delivery_params
    params.require(:delivery).permit(:quantity, :observation)
  end

  def delivery
    @delivery = Delivery.find(params[:id])
  end
end
