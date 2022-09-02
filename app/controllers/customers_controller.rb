# frozen_string_literal: true

require 'csv'
class CustomersController < ApplicationController
  skip_before_action :verify_authenticity_token
  # protect_from_forgery with: :null_session
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

  def file
    @file_row = []
    my_file = params[:file]
    # binding.pry
    counter = 0
    table = CSV.parse(File.read(params[:file]), headers: true)
    puts "Names of our users:\n#{table.by_col[0]}"
  end

  private

  def user_params
    params.require(:customer).permit(:first_name, :last_name, :date_of_birth)
  end
end
