class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews
    
    def full_name
      return "#{self.first_name} #{self.last_name}"
    end

    def favorite_restaurant
      return reviews.all.max_by{ |c| c.star_rating }
    end

    def add_review(restaurant, rating)
      Review.create(star_rating: star_rating, restaurant_id: restaurant_id)
    end

    def delete_reviews(restaurant)
      return restaurant.restaurant_id.destroy_by(star_rating: reviews.star_rating)
    end

end