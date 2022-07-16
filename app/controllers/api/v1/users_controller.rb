module Api
  module V1
    class UsersController < ApplicationController
      # User registration method
      def create
        @user = User.create(user_params)

        if @user.valid?
          token = encode_token({ user_email: @user.email })
          render json: { user: @user, token: token }, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end

      end

      # User login method
      def login
        @user = User.find_by(email: user_params[:email])

        if @user && @user.authenticate(user_params[:password])
          token = encode_token({ user_email: @user.email })
          return render json: { user: @user, token: token }, status: :ok
        end

        render json: @user.errors, status: :unauthorized
      end

      private

      def user_params
        params.permit(:email, :password)
      end
    end
  end
end


