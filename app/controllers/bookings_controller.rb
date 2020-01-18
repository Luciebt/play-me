class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def show
    @booking = Booking.find(params[:id])
    @total_price = get_total_price
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
  end

  def create
    @booking = Booking.new(booking_params)
    @instrument = Instrument.find(params[:instrument_id])
    @booking.instrument = @instrument
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to instrument_booking_path(@instrument, @booking)
    else
      render :new
    end
  end

  def get_total_price
    # (End date - start date) * Price per day
    @lucie = "aaaa"
    price = (@booking.end_date - @booking.start_date) * @booking.instrument.price
    price.to_i
  end

  private

  def booking_params
    params.require(:booking).permit(
      :location, :start_date, :end_date, :instrument_id
    )
  end
end
