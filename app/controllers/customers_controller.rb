class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    @customer.save
    # redirect_to @customerはredirect_to customer_path(@customer)と同じ動きになる
    # showにリダイレクトされる
    redirect_to @customer
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email
      )
  end
end
