class LedgersController < ApplicationController
    
    def index
        ledgers = Ledger.all
        render json:ledgers
    end

    def create
        binding.pry
        ledger = Ledger.create(user_id:User.all.sample.id, patient_id:params[:patient_id],current_room:params[:current_room],description:params[:description] )
        ledger = Ledger.create(user_id:User.all.sample.id, patient_id:51,current_room:params[:current_room],description:params[:description], main_image:params["images"])
        render json:ledger
    end

    def update
        ledger = Ledger.find(params[:id])
        ledger.description= params[:description]
        ledger.save!
        render json:ledger
    end

    def destroy
        ledger = Ledger.find(params[:id])
        ledger.destroy
    end

    
end
