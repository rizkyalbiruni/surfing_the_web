class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
  end

  def show
    @surfboard = Surfboard.find(params[:id])
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    if @surfboard.save
      redirect_to surfboard_path(@surfboard)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @surfboard = Surfboard.find(params[:id])
    @surfboard.destroy
    redirect_to surfboards_path, status: :see_other
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:type, :description, :location, :img_url)
  end
end