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
    @account = Account.create(account_params)
    redirect_to account_path(@account)
  end

  def edit; end

  def update
    @account.update(account_params)
    redirect_to accounts_path
  end

  def destroy
    @account.destroy
    redirect_to accounts_path
  end

  private

  def account_params
    params.require(:account).permit(:label, :iban, :currency, :currency_balance, :external_id)
  end

  def find_account
    @account = Account.find(params[:id])
  end
end
