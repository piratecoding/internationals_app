class International < ApplicationRecord
    has_many :friendships
    has_many :friends, :through => :friendships

    validates :name, :country, presence: true 
end
