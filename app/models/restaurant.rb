class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def Restaurant.fanciest
      return Restaurant.all.max_by{ |p| p.price }
    end
    
    def all_reviews
      reviews.all.map &:star_rating.includes?(self.name)
      return "Review for #{self.name} by #{self.customer.first_name} #{self.customer.last_name}: #{self.review.star_rating} stars."
    end

end