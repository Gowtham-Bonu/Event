class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :enrolls
    has_many :users, through: :enrolls
    belongs_to :category
    validates :name, :event_date, presence: true
end
