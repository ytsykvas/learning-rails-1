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
    @account = Account.find(params[:account_id])
    @transaction = @account.transactions.build(transaction_params)
    balance = if @transaction.transaction_type == 'payin'
                if @transaction.currency == 'EU'
                  @transaction.account.balance + @transaction.currency_balance
                else
                  @transaction.account.balance + @transaction.currency_balance * 0.9
                end
              else
                if @transaction.currency == 'EU'
                  @transaction.account.balance - @transaction.currency_balance
                else
                  @transaction.account.balance - @transaction.currency_balance * 0.9
                end
              end
    @transaction.account.update(balance: balance)
    if @transaction.save
      redirect_to account_transactions_path(@account)
      flash[:success] = 'transaction is created'
    else
      redirect_to new_account_transaction_path
      flash[:alert] = 'UNCORRECT. CHECK ALL FIELDS'
    end
  end

  def edit; end

  def update
    @transaction.update(@transaction_params)
  end

  def destroy
    @transaction.destroy
    redirect_to account_transactions_path
    flash[:success] = 'transaction is destroyed'
  end

  private

  def transaction_params
    params.require(:transaction).permit(:external_id, :currency, :currency_balance, :label, :transaction_type)
  end

  def find_transaction
    @transaction = Transaction.find(params[:id])
  end
end
