class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user , only: :destroy

  def index
    @users = User.paginate page: params[:pages]
  end

  def show
    @user = User.find params[:id]
    @lessons = Lesson.filter_lesson(@user.id)
                      .paginate(page: params[:page])
                      .order created_at: :DESC
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash.now[:success] = t :alert_signup_success
      redirect_to @user     
    else
      render "new"    
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    @user.update_attributes user_params
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = t :alert_delete
    redirect_to users_path  
  end

  private
  def user_params
    params.require(:user).permit :username, :email, :password, 
                                 :password_confirmation
  end

  def correct_user
    @user = User.find params[:id]
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin? 
  end
end
