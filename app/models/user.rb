class User < ApplicationRecord
    has_many :occasions, foreign_key: "creator_id", class_name: "Event"
    has_many :enrolls
    has_many :events, through: :enrolls
    has_one :address, as: :addressable
    has_secure_password
end
