class Friendship < ApplicationRecord
    belongs_to :international
    belongs_to :friend, class_name: 'International'

    after_create :create_inverse, unless: :has_inverse?
    after_destroy :destroy_inverses, if: :has_inverse?

    def create_inverse
      self.class.create(inverse_friendship_options)        
    end

    def destroy_inverse
      inverse.destroy_all
    end

    def has_inverse?
      self.class.exists?(inverse_friendship_options)      
    end

    def inverse
      self.class.where(inverse_friendship_options)      
    end

    def inverse_friendship_options
      { friend_id: international_id, international_id: friend_id  }      
    end
end
