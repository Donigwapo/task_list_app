module Api
    module V1
      class SessionsController < PagesController
        def create
          user = User.find_by(email: params[:email])
          
          if user.nil?
            render json: { message: 'User not found' }, status: :not_found
          elsif user.valid_password?(params[:password])
            sign_in(user)
            render json: { message: 'Sign-in successful!', user: user.as_json(except: :encrypted_password) }, status: :ok
          else
            render json: { message: 'Invalid email or password' }, status: :unauthorized
          end
        end
      end
    end
  end
  