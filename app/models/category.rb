class Category < ActiveRecord::Base
  has_many :lessons, dependent: :destroy
  has_many :words, dependent: :destroy
  
  validates :name, presence: true, length: {maximum: 30}

  accepts_nested_attributes_for :words
end
