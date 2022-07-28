class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(user_params)
    if @customer.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def import
    
  end

  private
  def user_params
    params.require(:customer).permit(:first_name, :last_name, :date_of_birth)
  end
end

