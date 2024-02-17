module Api
    module V1
      class TasklistController < ApplicationController
        

        def index
          tasks = TaskTable.order(created_at: :desc)
          render json: TaskTableSerializer.new(tasks).serialized_json
        end
  
        def show
        task = TaskTable.find_by(id: params[:id])
          render json: TaskTableSerializer.new(task).serialized_json
        end
  
        def create
          task = TaskTable.new(tasklist_params)
  
          if task.save
            render json: TaskTableSerializer.new(task).serialized_json
          else
            render json: { error: task.errors.messages }, status: 422
          end
        end
  
        def update
            task = TaskTable.find_by(id: params[:id])
  
          if task.update(tasklist_params)
            render json: TaskTableSerializer.new(task).serialized_json
          else
            render json: { error: task.errors.messages }, status: 422
          end
        end
  
        def destroy
            task = TaskTable.find_by(id: params[:id])
  
          if task.destroy
            head :no_content
          else
            render json: { error: task.errors.messages }, status: 422
          end
        end
  
        private
  
        def tasklist_params
            params.permit(:taskname, :taskdescription)
        end
  
       

      end
    end
  end
  