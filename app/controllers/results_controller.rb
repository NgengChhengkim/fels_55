class ResultsController < ApplicationController
  before_action :logged_in_user
  
  def index
    @lessons = current_user.lessons
  end

  def show
    @word_lessons = Lesson.find(params[:id]).word_lessons.answer_not_nil
  end
end
