class TaskTableSerializer
  include FastJsonapi::ObjectSerializer
  attributes :taskname, :taskdescription
end
