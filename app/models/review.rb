class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user
  validates :rating, inclusion: (1..5)
  validates :user, uniqueness: { scope: :restaurant, message: "has reviewed this restaurant already" }
  has_many :endorsements
  # validates :user, presence: true

end
