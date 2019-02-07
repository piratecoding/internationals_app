class International < ApplicationRecord
    validates :name, :country, presence: true 
end
