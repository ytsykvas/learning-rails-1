# frozen_string_literal: true

class AccountsController < ApplicationController
  before_action :find_account, only: %i[show edit update destroy]

  def index
    @accounts = Account.all
  end

  def show; end

  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    if @account.save
      redirect_to account_path(@account)
      flash[:success] = 'account saved'
    else
      redirect_to new_account_path
      flash[:alert] = 'UNCORRECT. CHECK ALL FIELDS !'
    end
  end

  def edit; end

  def update
    @account.update(account_params)
    redirect_to account_path
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:label, :iban, :balance, :external_id)
  end

  def find_account
    @account = Account.find(params[:id])
  end
end
