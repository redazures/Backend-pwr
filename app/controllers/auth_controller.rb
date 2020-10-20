class AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create
        @user = User.find_by(email: params[:email])
        # binding.pry
        if @user && @user.authenticate(params[:password])
            # token = encode_token({ user_id: @user.id }) // we are just encoding the user ID.
            # we should be sending back the token only with the user encoded. 
            # then we decode the user inside the coken
            # render json: { user: UserSerializer.new(@user), jwt: token }, status: :accepted
            token = encode_token({ user_id: @user.id })
            render json: { jwt: token }, status: :accepted
        else
            render json: { message: 'Invalid User email and password' }, status: :unauthorized
        end
    end


    private
    def user_login_params
        params.require(:user).permit(:email, :password)
    end
end