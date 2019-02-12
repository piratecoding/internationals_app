class International < ApplicationRecord
    has_many :friendships
    has_many :friends, :through => :friendships, dependent: :destroy
    # has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
    # has_many :inverse_friends, :through => :inverse_friendships, :source => :international

    validates :name, :country, presence: true 

    def country_name
        country = self.country
        ISO3166::Country[country]
    end

    scope :other_internationals, -> (id) { where.not(id: ids) }
end
