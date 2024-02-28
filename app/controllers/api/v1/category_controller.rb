module Api
    module V1
      class CategoryController < ApplicationController
        

        def index
          categories = Category.order(created_at: :desc)
          render json: CategorySerializer.new(categories).serialized_json
        end
  
        def show
        categories = Category.find_by(id: params[:id])
          render json: CategorySerializer.new(categories).serialized_json
        end
  
        def create
            categories = Category.new(categories_params)
  
          if categories.save
            render json: CategorySerializer.new(categories).serialized_json
          else
            render json: { error: categories.errors.messages }, status: 422
          end
        end
  
        def update
            categories = Category.find_by(id: params[:id])
  
          if categories.update(categories_params)
            render json: CategorySerializer.new(categories).serialized_json
          else
            render json: { error: categories.errors.messages }, status: 422
          end
        end
  
        def destroy
            categories = Category.find_by(id: params[:id])
  
          if categories.destroy
            head :no_content
          else
            render json: { error: categories.errors.messages }, status: 422
          end
        end
  
        private
  
        def categories_params
            params.permit(:name)
        end
  
       

      end
    end
  end
  