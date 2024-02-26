class TaskTableSerializer
  include FastJsonapi::ObjectSerializer
  attributes :taskname, :taskdescription, :created_at, :completed
end
