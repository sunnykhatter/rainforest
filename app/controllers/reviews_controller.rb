class ReviewsController < ApplicationController
  before_filter :load_product
  before_filter :ensure_logged_in, :only => [:edit, :create, :update, :destroy]

  def show
  	@review = Review.find(params[:id])
  end

  def create

  	@review = @product.reviews.build(params[:review])

  	if @review.save
  		redirect_to products_path, notice: 'Review created successfully'
  	else 
  		render :action => :show
  	end
  end

  def destroy
  	@review = Review.find(params[:id])
  	@review.destroy
  end

  private

  def load_product
  	@product = Product.find(params[:product_id])
  end
end
