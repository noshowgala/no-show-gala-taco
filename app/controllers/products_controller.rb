class ProductsController < ApplicationController
  before_action :no_cache
  before_action :reset_donation, only: [:index]

  def index
    @products = Product.all
  end

  private

  def reset_donation
    session.delete(:donation_id) if session[:donation_id]
  end

  def no_cache
    response.headers["Cache-Control"] = "no-store, no-cache, must-revalidate, post-check=0, pre-check=0"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end
end
