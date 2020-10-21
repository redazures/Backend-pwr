class MessagesController < ApplicationController

    def create
        # binding.pry
        message = Message.create!(sender_id:params["sender_id"],recipient_id: params["recipient_id"],content:params["content"])
        render json:message
    end

    private 

    def message_params
        params.require(:message).params(:content, :sender_id, :recipient_id )
    end


end