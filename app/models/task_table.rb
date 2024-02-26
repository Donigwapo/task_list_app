class TaskTable < ApplicationRecord
    belongs_to :category
    validates :taskname, presence: true
    validates :taskdescription, presence: true
    
    attribute :completed, :boolean, default: false
end
