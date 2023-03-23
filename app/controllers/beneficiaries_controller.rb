class BeneficiariesController < ApplicationController
  before_action :set_beneficiary, only: %i[ edit update destroy ]

  def index
    @beneficiaries = Beneficiary.order(created_at: :desc)
  end

  def new
    @beneficiary = Beneficiary.new
  end

  def edit
  end

  def create
    @beneficiary = Beneficiary.new(beneficiary_params)

    if @beneficiary.save
      redirect_to beneficiaries_path, notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @beneficiary.update(beneficiary_params)
      redirect_to beneficiaries_path, notice: t('.updated')
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @beneficiary.destroy
    redirect_to beneficiaries_path, notice: t('.deleted'), status: :see_other
  end

  private
    def set_beneficiary
      @beneficiary = Beneficiary.find(params[:id])
    end

    def beneficiary_params
      params.require(:beneficiary).permit(:names, :email, :first_surname, :second_surname, :cel_phone, :born, :other_address, :expiration_date_document, :status_document, :family_unit, :terms_conditions)
    end
end
