class TasksController < ApplicationController
 before_action :set_user
 before_action :set_task, only: [:show, :edit, :update,:destroy]
 def show
 end
 
 def index
   @tasks = Task.where(user_id: params[:user_id])
 end
  
 def new
  @task = Task.new
 end
  
 def create
   @task = @user.tasks.build(task_params)
   if @task.save
     flash[:success] = "新規タスクを作成しました。"
     redirect_to user_tasks_url(@user)
   else
     render :new
   end
 end
  
 def edit
 end
 
 def update
   if @task.update_attributes(task_params)
    flash[:success] = "タスクを更新しました。"
    redirect_to user_tasks_url(@user)
   else
    render :new
   end
 end
 
 def destroy
  @task.destroy
  flash[:danger] = "タスクを消去しました。"
  redirect_to user_tasks_url @user
 end
  
   private
   
     def set_user
      @user = User.find(params[:user_id])
     end
     
     def set_task
      unless @task = @user.tasks.find_by(id: params[:id])
       flash[:danger] = "権限がありません。"
       redirect_to root_path
      end
     end
    
   
     def task_params
        params.require(:task).permit(:name, :description)
     end
  
  
end
