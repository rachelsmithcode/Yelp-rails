class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @restaurant = Restaurant.find params[:restaurant_id]
     @review = @restaurant.build_review review_params, current_user

     if @review.save
       redirect_to restaurants_path
     else
       if @review.errors[:user]
         # Note: if you have correctly disabled the review button where appropriate,
         # this should never happen...
         redirect_to restaurants_path, alert: 'You have already reviewed this restaurant'
       else
         # Why would we render new again?  What else could cause an error?
         render :new
       end
     end
  end

  def review_params
    params.require(:review).permit(:thoughts, :rating)
  end

  def user_owns_review?
    @review.user == current_user
  end

  def destroy
    @review = Review.find(params[:id])
    if user_owns_review?
      @review.destroy
      flash[:notice] = 'Review deleted successfully'
    else
      flash[:notice] = 'Cannot delete this review as you did not add it'
    end
    redirect_to '/restaurants'
  end

end
