class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :email, :employee_id
end

