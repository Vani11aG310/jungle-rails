class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: ENV['USER_NAME'], password: ENV['PASSWORD']
  def show
    @products = Product.order(id: :desc).all
    @categories = Category.order(id: :desc).all
  end
end
