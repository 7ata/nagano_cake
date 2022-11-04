class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer)
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:customer).permit(:id,:last_name,:fast_name,:last_name_kana,:fast_name_kana,
    :email,:encrypted_password,:postal_code,:address,:telephone_number,:is_deleted,:created_at,:updated_at)
  end
end
