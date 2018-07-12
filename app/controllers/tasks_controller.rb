class TasksController < ApplicationController

  def index
    @new_task = Task.new
    @all_tasks = Taks.all
    @todo_tasks = @all_tasks.where(status: :todo)
    @done_tasks = @all_tasks.where(status: :done)
  end
  def create
  end
  def edit
  end
  def update
  end
end
