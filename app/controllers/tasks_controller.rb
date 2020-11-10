class TasksController < ApplicationController
  def index
    @tasks = Task.where(user_id: params[:user_id])
  end
  
  def new
    @task = Task.find(params[:user_id])
  end
  
  def create
    @task = Task.new(params_task)
    if @task.save
      flash[:success] = "新規タスクを作成しました。"
      redirect_to @task
    else
      render :new
    end
  end
  
  def edit
  end
  
  private
   
   def params_task
     params.require(:task).permit(:name,:description)
   end
  
end
