class TaskTableSerializer
  include FastJsonapi::ObjectSerializer
  attributes :taskname, :taskdescription, :category_id, :created_at, :isCompleted, :user_id, :end_date
end
