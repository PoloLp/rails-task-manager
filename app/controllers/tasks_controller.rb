class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :edit]

  def index
    @tasks = Task.all
  end

  def show
    byebug
  end

  def create
    @task = Task.new(task_params)
    @task.save

    redirect_to task_path(@task)
  end

  def new
    @task = Task.new
  end

  def update
    @task.update(task_params)

    redirect_to task_path(@task)
  end

  def edit
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    # no need for app/views/tasks/destroy.html.erb
    redirect_to tasks_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:title, :details)
  end
end
