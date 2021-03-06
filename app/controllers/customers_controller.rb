class CustomersController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :index, :show]
  before_action :set_customer, only: [:show, :edit, :destroy, :update]
  def index
    # @customers = Customer.all
    # 上記の内容を下記に変更
    # @customers = Customer.page(params[:page])
    # 上記の内容を下記に変更
    @q = Customer.search(params[:q])
    @customers = @q.result(distinct: true).page(params[:page])
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
    # @customer = Customer.find(params[:id])　→set_customerへ
  end

  def update
    # @customer = Customer.find(params[:id])　→set_customerへ
    if @customer.update(customer_params)
      redirect_to @customer
    else
      render :edit
    end
  end

  def show
    # @customer = Customer.find(params[:id])　→set_customerへ
    @comment = Comment.new # これをform_forで使う
    
    # @comments = Comment.where(customer_id: params[:id].to_i)
    # associationを設定しているため、もっと簡単で直感的に置き換えることができる
    @comments = @customer.comments
  end

  def destroy
    # @customer = Customer.find(params[:id]) →set_customerへ
    @customer.destroy
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :given_name,
      :email,
      :company_id,
      :post_id
      )
  end
  
  def set_customer
    @customer = Customer.find(params[:id])
  end
end
