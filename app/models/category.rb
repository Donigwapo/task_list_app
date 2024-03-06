class Category < ApplicationRecord
    has_many :task_tables
    belongs_to :user
    validates :name, uniqueness: true, length: { in: 1..10 }

   
end