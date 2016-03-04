class Restaurant < ActiveRecord::Base

  has_many :reviews, dependent: :destroy
  validates :name, length: {minimum: 3}, uniqueness: true
  belongs_to :user

  def build_review(attributes = {}, user)
    attributes[:user] ||= user
    reviews.build(attributes)
  end

  def average_rating
    return 'N/A' if reviews.none?
    #  reviews.inject(0) {|memo, review| memo + review.rating} / reviews.length.to_i
    total = 0
     reviews.each{|review| puts review.rating}
     total/reviews.length.to_i
  end

end
