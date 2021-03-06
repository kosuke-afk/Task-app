class UsersController < ApplicationController
  
  def index
    @users = User.paginate(page: params[:page], per_page: 20)
  end
  
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
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
  
  def edit
    @user = User.find(params[:id])
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "#{@user.name}を消去しました。"
    redirect_to users_url
  end
  
  private
  

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    
end
