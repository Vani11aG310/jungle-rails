require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'Saves to database' do
      @category = Category.create(:name => "shrub")
      @product = Product.new(:name => 'test', :description => 'test description', :category_id => @category.id, :quantity => 2, :price_cents => 1200 )
      expect(@product.errors.full_messages).to match_array([])
    end

    it 'Validates that name cannot be nil' do
      @category = Category.create(:name => "shrub")
      @product = Product.create(:name => nil, :description => 'test description', :category_id => @category.id, :quantity => 2, :price_cents => 1200 )
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'Validates that price cannot be nil' do
      @category = Category.create(:name => "shrub")
      @product = Product.create(:name => "test", :description => 'test description', :category_id => @category.id, :quantity => 2, :price_cents => nil )
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'Validates that quantity cannot be nil' do
      @category = Category.create(:name => "shrub")
      @product = Product.create(:name => "test", :description => 'test description', :category_id => @category.id, :quantity => nil, :price_cents => 1200 )
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    
    it 'Validates that category cannot be nil' do
      @category = Category.create(:name => "shrub")
      @product = Product.create(:name => "test", :description => 'test description', :category_id => nil, :quantity => 2, :price_cents => 1200 )
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end

  end
end
