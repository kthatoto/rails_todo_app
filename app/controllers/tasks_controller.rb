class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @all_tasks = Task.all.recently_updated
    @todo_tasks = @all_tasks.where(status: :todo)
    @done_tasks = @all_tasks.where(status: :done)
  end
  def create
  end
  def edit
  end
  def update
    @task = Task.find_by(id: params[:id].to_i)
    unless @task
      render :root
    end
    if @task.update(task_params)
      redirect_to :root
    end
  end
  private
    def task_params
      params[:task][:status] = params[:task][:status].to_i if params[:task] && params[:task][:status]
      params.require(:task).permit(:assignee, :content, :status)
    end
end
