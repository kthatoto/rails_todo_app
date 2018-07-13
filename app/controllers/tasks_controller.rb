class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @all_tasks = Task.all.recently_updated
    @todo_tasks = @all_tasks.where(status: :todo)
    @done_tasks = @all_tasks.where(status: :done)
  end
  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:success] = "success：作成しました"
    else
      flash[:warning] = "error：作成できませんでした"
    end
    redirect_to :root
  end
  def edit
    @editing_task = Task.find_by(id: params[:id].to_i)
    unless @editing_task
      redirect_to :root
    end
  end
  def update
    @task = Task.find_by(id: params[:id].to_i)
    unless @task
      flash[:danger] = "error：不正な値です"
      return render :root
    end
    if @task.update(task_params)
      flash[:success] = "success：更新しました"
      redirect_to :root
    else
      @editing_task = @task
      flash.now[:warning] = "error：更新できませんでした"
      render 'edit'
    end
  end
  private
    def task_params
      params[:task][:status] = params[:task][:status].to_i if params[:task] && params[:task][:status]
      params.require(:task).permit(:assignee, :content, :status)
    end
end
