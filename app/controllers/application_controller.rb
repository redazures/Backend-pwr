class ApplicationController < ActionController::API
    # before_action :authorized

    def encode_token(payload)
        JWT.encode(payload, '3lite/-\\/\/350/\/\3')
    end

    def auth_header
        request.headers['Authorization']
    end

    def decoded_token
        # binding.pry
        if params["headers"]
            token = params["headers"].split(' ')[1]
            # token = params["headers"]["Authorization"].split(' ')[1] if params["headers"]["Authorization"]
            begin
                JWT.decode(token, '3lite/-\\/\/350/\/\3', true, algorithm: 'HS256')
            rescue JWT::DecodeError
                nil
            end
        end
    end

    def current_user
        # binding.pry
        if decoded_token
            user_id = decoded_token[0]["user_id"]
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        # binding.pry
        !!current_user
    end

    def authorized        
        # binding.pry
        render json: { message: 'Please log in' }, status: :unauthorized unless logged_in?
    end

end
