class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
    @task = Task.new
  end

  def show;end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path
    else
      @tasks = Task.all
      render :index
    end
  end

  def edit;end

  def update
    if @task.update(task_params)
    redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def set_task
    @task = Task.find(params[:id])
  end


  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
