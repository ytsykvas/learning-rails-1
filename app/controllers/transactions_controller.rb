# frozen_string_literal: true

class TransactionsController < ApplicationController
  before_action :find_transaction, only: %i[show update destroy]

  def index
    @transactions = Account.find(params[:account_id]).transactions
  end

  def show; end

  def new
    @transaction = Transaction.new
  end

  def create
    @transaction = Account.find(params[:account_id]).transactions.create(transaction_params)
    redirect_to account_transactions_path, notice: 'transaction is created'
  end

  def edit
  end

  def update
    @transaction.update(@transaction_params)
  end

  def destroy
    @transaction.destroy
    redirect_to account_transactions_path, notice: 'transaction is destroyed'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:external_id, :currency, :currency_balance, :label, :transaction_type)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
