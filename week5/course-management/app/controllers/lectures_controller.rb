class LecturesController < ApplicationController

  def index
    @lecture = Lecture.new
    @lectures = Lecture.all.reverse
  end

  def show
    @lecture = Lecture.find(params[:id])
  end

  def create
    @lecture = Lecture.new(allowed_params)
    if @lecture.save
      redirect_to @lecture
    else
      render :index
    end
  end

  def destroy
    @lecture = Lecture.find(params[:id])
    @lecture.destroy
    redirect_to lectures_path
  end

  def update
    @lecture = Lecture.find(params[:id])
    if @lecture.update_attributes(allowed_params)
      redirect_to lectures_path, :notice => "Your lecture was updated!"
    else
      render :show
    end
  end

  private
  def allowed_params
    params.require(:lecture).permit(:name, :body)
  end

end
