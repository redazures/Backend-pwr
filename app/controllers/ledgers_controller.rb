class LedgersController < ApplicationController
    
    def index
        ledgers = Ledger.all
        render json:ledgers
    end

    def destroy
        binding
        ledger = Ledger.find(params[:id])
        ledger.destroy
    end
end
