class Word < ActiveRecord::Base
  belongs_to :category
  has_many :answers, dependent: :destroy
  has_many :word_lessons, dependent: :destroy
  has_many :lessons, through: :word_lessons
  
  validates :keyword, presence: true, length: {maximum: 30}

  accepts_nested_attributes_for :answers
end
