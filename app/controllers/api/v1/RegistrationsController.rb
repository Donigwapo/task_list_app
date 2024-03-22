module Api
    module V1
      class RegistrationsController < ApplicationController
        def create
          user = User.new(user_params)
  
          if user.save
            render json: { message: 'User created successfully', user: user }, status: :created
          else
            render json: { message: 'Failed to create user', errors: user.errors }, status: :unprocessable_entity
          end
        end
  
        private
  
        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
  