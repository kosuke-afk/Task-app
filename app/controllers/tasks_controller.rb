class TasksController < ApplicationController
  
 def show
   @task = Task.find(params[:user_id])
 end
 def index
   @tasks = Task.where(user_id: params[:user_id])
 end
  
 def new
  @task = Task.new
 end
  
 def create
   @user = User.find(params[:user_id])
   @task = Task.new(task_params)
   if @task.save
     flash[:success] = "新規タスクを作成しました。"
     redirect_to user_tasks_url(@user)
   else
     render :new
   end
 end
  
 def edit
 end
  
   private
   
     def task_params
        params.require(:task).permit(:name, :description).merge(user_id: params[:user_id])
     end
  
end
