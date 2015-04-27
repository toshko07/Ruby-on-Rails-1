class BrandsController < ApplicationController

  def index
    @brands = Brand.all
  end

  def count
    @count = Brand.all.count
  end

  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(allowed_params)

    if @brand.save
      redirect_to brands_path
    else
      render 'new'
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private 
      def allowed_params
        params.require(:brand).permit(:name, :description)
      end
end
