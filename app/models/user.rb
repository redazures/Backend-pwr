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

end