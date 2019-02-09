class Friendship < ApplicationRecord
    belongs_to :international
    belongs_to :friend, :class_name => 'International'
end
