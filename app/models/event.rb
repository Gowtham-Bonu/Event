class Event < ApplicationRecord
    belongs_to :creator, class_name: "User"
    has_many :enrolls, dependent: :destroy
    has_many :users, through: :enrolls, dependent: :destroy
    belongs_to :category
    has_many :comments, as: :commentable, dependent: :destroy
    validates :name, :event_date, :category, presence: true
end
