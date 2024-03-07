module Api
    module V1
      class UsersController < BaseController
        def index
          @users = User.all
          render json: @users
        end

        def show
            @user = User.find(params[:id])
            render json: @user
          end

        def destroy
          @user = User.find(params[:id])
         @user.destroy
        end
       end
    end
  end
  