class TaskTable < ApplicationRecord
    belongs_to :category
    belongs_to :user
    validates :taskname, presence: true
    validates :taskdescription, presence: true
    validates :end_date, presence: true
    attribute :isCompleted, :boolean
end
