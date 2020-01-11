class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
    @categories = Instrument.categories.keys
  end

  def edit
    authorize @instrument
  end

  def update
    authorize @instrument
    @instrument = Instrument.find(params[:id])
    if @instrument.update(params[:instrument])
      redirect_to instrument_path(@instrument)
    else
      render :edit
    end
  end

  def create
    @instrument = Instrument.new(instrument_params)
    @instrument.user_id = current_user.id
    authorize @instrument

    if @instrument.save
      redirect_to instrument_path(@instrument)
    else
      render :new
    end
  end

  def destroy
    authorize @instrument
    instrument = Instrument.find(params[:id])
    instrument.destroy
    redirect_to instrument_path(instrument)
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :photo, :description, :price, :category, :city)
  end
end
