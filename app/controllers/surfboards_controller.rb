class SurfboardsController < ApplicationController
  def index
    @surfboards = Surfboard.all
    @markers = @surfboards.geocoded.map do |surfboard|
      {
        lat: surfboard.latitude,
        lng: surfboard.longitude
      }
    end
  end

  def show
    @surfboard = Surfboard.find(params[:id])
  end

  def new
    @surfboard = Surfboard.new
  end

  def create
    @surfboard = Surfboard.new(surfboard_params)
    @user = current_user
    if @surfboard.save
      redirect_to surfboard_path(@surfboard)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def upload
    @surfboard = Surfboard.new(surfboard_params)
    image_data = params[:file]
    uploaded_image = Cloudinary::Uploader.upload(image_data)
    image_url = uploaded_image['secure_url']
    redirect_to surfboard_path(@surfboard), notice: "Image uploaded successfully!"
  end

  def destroy
    @surfboard = Surfboard.find(params[:id])
    @surfboard.destroy
    redirect_to surfboards_path, status: :see_other
  end

  private

  def surfboard_params
    params.require(:surfboard).permit(:board_type, :description, :location, :img_url, :availibility, :user_id, photos: [])
  end
end
