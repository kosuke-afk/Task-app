class TasksController < ApplicationController
 before_action :set_user
 before_action :set_task
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
   @task = @user.tasks.build(task_params)
   if @task.save
     flash[:success] = "新規タスクを作成しました。"
     redirect_to user_tasks_url(@user)
   else
     render :new
   end
 end
  
 def edit
  @task = Task.find(params[:user_id])
 end
 
 def update
 end
  
   private
   
     def set_user
      @user = User.find(params[:user_id])
     end
     
     def set_task
      @task = Task.find_by(user_id: params[:user_id])
     end
   
     def task_params
        params.require(:task).permit(:name, :description)
     end
  
  
end
