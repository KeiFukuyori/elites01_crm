class CustomersController < ApplicationController
  def index
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    # @customer.save
    # redirect_to @customer
    # 上記2行の記述を下記に修正
    if @customer.save
      redirect_to @customer
    else
      render :new
    end
    # render :newの場合、newアクションは実行されず、newのviewだけ表示される
    
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to root_path
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
