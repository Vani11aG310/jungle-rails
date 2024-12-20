class Admin::DashboardController < ApplicationController
  before_action :authorize
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.order(id: :desc).all
  end
end
