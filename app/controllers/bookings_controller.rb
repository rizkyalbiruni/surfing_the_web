class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
   @booking = Booking.find(params[:id])
  end

  def new
    @surfboard = Surfboard.find(params[:surfboard_id])
    @user = current_user
    @booking = Booking.new
  end

  def create
    @surfboard = Surfboard.find(params[:surfboard_id])
    @user = current_user
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
    params.require(:booking).permit(:start_date, :end_date)
  end
end
