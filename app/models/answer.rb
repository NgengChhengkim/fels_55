class Answer < ActiveRecord::Base
  belongs_to :word, inverse_of: :answers
  has_many :word_lessons

  validates :meaning, presence: true
  validates :word, presence: true
end
