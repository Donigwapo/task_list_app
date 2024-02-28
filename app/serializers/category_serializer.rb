class CategorySerializer
  include FastJsonapi::ObjectSerializer
  attributes :name

  has_many :task_tables
end
