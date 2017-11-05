require_relative 'review'

module Models
  class Reviews
    attr_accessor :positive_reviews, :negative_reviews
    def initialize(args)
      # Removes the first element of the array since it contains app info
      reviews = args['feed']['entry']
      reviews.shift
      @positive_reviews = []
      @negative_reviews = []

      process_reviews(reviews)
    end
    
    def process_reviews(reviews)
      reviews.each do |review|
        app_review = Review.new(review)
        if app_review.rating >= 4
          positive_reviews.push(app_review)
        else
          negative_reviews.push(app_review)
        end
      end
    end
    
    def random_positive_review
      positive_reviews.sample
    end
    
    def random_negative_review
      negative_reviews.sample
    end
    
    def to_hash
      {
        random_positive_review: random_positive_review.to_hash,
        random_negative_review: random_negative_review.to_hash
      }
    end
  end
end