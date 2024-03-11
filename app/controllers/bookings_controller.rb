class BookingsController < ApplicationController
  def show
    @surfboard = Surfboard.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @surfboard = Surfboard.find(params[:surfboard_id])
    @booking = Booking.new(booking_params)
    @booking.surfboard = @surfboard
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def approve

  end

  def decline
    
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :surfboard_id, :start_date, :end_date)
  end
end
