class LedgersController < ApplicationController
    
    def index
        ledgers = Ledger.all
        render json:ledgers
    end

    def update
        # binding.pry
        ledger = Ledger.find(params[:id])
        ledger.description= params[:description]
        ledger.save!
        render json:ledger
    end

    def destroy
        binding
        ledger = Ledger.find(params[:id])
        ledger.destroy
    end
end
