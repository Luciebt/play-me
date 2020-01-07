class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def show
    @instrument = Instrument.find(params[:id])
  end

  def new
    authorize @instrument
    @instrument = Instrument.new
  end
Instrument
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

  def create
    authorize @instrument
    @instrument = Instrument.new(instrument_params)

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
    params.require(:instrument).permit(
      :name, :photo, :description, :price)
  end
end
