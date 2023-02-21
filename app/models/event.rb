class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :enrolls
    has_many :users, through: :enrolls
    belongs_to :category
    has_many :comments, as: :commentable
    validates :name, :event_date, :category, presence: true
end
