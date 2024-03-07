module Api
module V1
class IndexController < BaseController
    def index
        @task_tables = TaskTable.all
    end
    end
end
end
