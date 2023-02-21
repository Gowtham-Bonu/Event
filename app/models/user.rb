class User < ApplicationRecord
    has_many :occasions, foreign_key: "creator_id", class_name: "Event", dependent: :destroy
    has_many :enrolls, dependent: :destroy
    has_many :events, through: :enrolls, dependent: :destroy
    has_one :address, as: :addressable, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_secure_password
end
