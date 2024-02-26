class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :email, :password, :created_at, :updated_at
end