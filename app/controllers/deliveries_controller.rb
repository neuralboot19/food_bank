class DeliveriesController < ApplicationController
  before_action :set_delivery, only: %i[ edit update destroy ]

  def index
    @deliveries = Delivery.all
    if params[:query_text].present?
      # beneficiary = Beneficiary.where(email: params[:query_text].downcase).last
      beneficiary = Beneficiary.find_by("email ILIKE :search OR names ILIKE :search OR identity ILIKE :search", { search: params[:query_text].downcase })
      @deliveries = @deliveries.where(beneficiary_id: beneficiary.id) if beneficiary.present?
    end
    if params[:order_by].present?
      order_by = Delivery::ORDER_BY.fetch(params[:order_by]&.to_sym, Delivery::ORDER_BY[:newest])
      @deliveries = @deliveries.order(order_by).load_async
    end
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
      params.require(:delivery).permit(:quantity, :observation, :beneficiary_id)
    end
end
