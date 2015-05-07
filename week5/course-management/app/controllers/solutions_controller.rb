class SolutionsController < ApplicationController
  def index
    @lecture = Lecture.find(params[:lecture_id])
    @solutions = Solution.all
    @task = Task.find(params[:task_id])
  end

  def show
    @solution = Solution.find(params[:id])
    @task = Task.find(params[:task_id])
  end

  def new
    @lecture = Lecture.find(params[:lecture_id])
    @solution = Solution.new
    @task = Task.find(params[:task_id])
  end

  def create
    @solution = Solution.new(allowed_params)
    if @solution.save
      redirect_to lecture_task_solutions_path
    else
      render :new
    end
  end

  def edit
    @lecture = Lecture.find(params[:lecture_id]) 
    @task = Task.find(params[:task_id])
    @solution = Solution.find(params[:id])  
  end

  def update
    @solution = Solution.find(params[:id])
    if @solution.update_attributes(allowed_params)
      redirect_to lecture_task_solutions_path, notice: "Your solution was updated!"
    else
      render :edit
    end
  end

  def destroy
    @solution = Solution.find(params[:id])
    @solution.delete
    redirect_to lecture_task_solutions_path
  end

  def allowed_params
    params.require(:solution).permit(:body)
  end
end
