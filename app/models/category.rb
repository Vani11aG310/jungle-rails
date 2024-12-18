class Category < ApplicationRecord

  has_many :products

  validates :name, presence: true
  validates :name, uniqueness: { :case_sensitive => false }
end
