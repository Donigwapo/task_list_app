class Category < ApplicationRecord
    has_many :task_tables
    validates :name, uniqueness: true
end
