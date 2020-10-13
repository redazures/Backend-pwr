class LedgersController < ApplicationController
    
    def index
        ledgers = Ledger.all
        render json:ledgers
    end
end
