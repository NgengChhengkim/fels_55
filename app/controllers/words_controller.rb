class WordsController < ApplicationController
  before_action :logged_in_user
  
  def index
    if params[:word].present?
      word_status = params[:word][:status]
      category = Category.find params[:word][:category_id]
      @words = category.words.send "#{word_status}_by", current_user
    else    
      @word = Word.new
      @categories = Category.order(:name).map{|category| [category.name, category.id]}
      @words = Category.order(:name).first.words      
    end
  end
end
