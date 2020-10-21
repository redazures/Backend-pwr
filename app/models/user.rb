class User < ApplicationRecord
    has_many :ledgers
    has_many :patients, through: :ledgers
    has_secure_password
    validates :email, uniqueness: true


    has_many :sender_messages, foreign_key: :recipient_id, class_name: "Message"
    has_many :senders, through: :sender_messages, source: :sender

    has_many :recipient_messages, foreign_key: :sender_id, class_name: "Message"
    has_many :recipients, through: :recipient_messages, source: :recipient
    
    def send_message(recipient_name, text_content)
        recipient = User.find_by(name:recipient_name)
        Message.create!(sender_id:self.id, recipient_id: recipient.id,content:text_content)
    end

    def message_exchange(id)
        recieved = self.sender_messages.select{|mess|mess.sender_id==id}
        sent = self.recipient_messages.select{|mess|mess.recipient_id==id}
        all=recieved + sent
        sorted_all=all.sort_by{|m|m.id}
    end

    def all_messages
        senders= self.sender_messages.map{|mess|mess.sender_id}
        recipients = self.recipient_messages.map{|mess|mess.recipient_id}
        correspondence= senders + recipients
        correspondence = correspondence.uniq
        correspondence.map do |id|
            {
                correspondent: {id:User.find(id).id,name:User.find(id).name},
                messages: self.message_exchange(id)
            }
        end
    end

    
end