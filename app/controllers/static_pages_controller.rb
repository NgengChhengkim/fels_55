class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @lessons = Lesson.filter_lesson(current_user.id)
                  .paginate(page: params[:page])
                  .order created_at: :DESC
    end
  end
end
