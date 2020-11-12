class UsersController < ApplicationController
  before_action :set_user
  before_action :set_task
  
  def show
  end

  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_task
      @task = Task.find(params[:id])
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    
end
