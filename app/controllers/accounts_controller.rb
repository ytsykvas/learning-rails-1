class AccountsController < ApplicationController
    def index
        #binding.pry
        @account = Account.all
    end

    def show
        @account = Account.find(params[:id])
    end


    def new
        @account = Account.new
    end

    def create
        @account = Account.create(account_params)
        redirect_to account_path(@account)
    end

    def edit
        @account = Account.find(params[:id])
    end

    def update
        @account = Account.find(params[:id])
        @account.update(account_params)
        redirect_to accounts_path
    end

    def destroy
        @account = Account.find(params[:id])
        @account.destroy
        redirect_to account_path
    end

    private
    def account_params
        params.require(:account).permit(:label, :iban, :currency, :currency_balance, :external_id)
    end
end
