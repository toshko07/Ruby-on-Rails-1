class TasksController < ApplicationController
  def index
    @lecture = Lecture.find(params[:lecture_id])
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.new
  end

  def edit
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(allowed_params)    
    if @task.save
      redirect_to lecture_tasks_path
    else
      render :new
    end
  end

  def update
    @task = Task.find(params[:id])
    @lecture = Lecture.find(params[:lecture_id])
    if @task.update_attributes(allowed_params)
      redirect_to lecture_tasks_path, :notice => "Your task was updated!"
    else
      render :edit
    end
  end

  def destroy
    @lecture = Lecture.find(params[:lecture_id])
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to lecture_tasks_path
  end

private
  def allowed_params
   params.require(:task).permit(:name, :description)
  end

end
