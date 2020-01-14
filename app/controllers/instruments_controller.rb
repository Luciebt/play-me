class InstrumentsController < ApplicationController
  def index
    if params[:query].present?
      @instruments = policy_scope(Instrument.where(category: params[:query]))
    else
      @instruments = policy_scope(Instrument.all)
    end
  end

  def show
    @instrument = Instrument.find(params[:id])
    authorize @instrument
  end

  def new
    @instrument = Instrument.new
    authorize @instrument
    @categories = Instrument.categories
  end

  def edit
    @instrument = Instrument.find(params[:id])
    @categories = Instrument.categories.keys
    authorize @instrument
  end

  def update
    @instrument = Instrument.find(params[:id])
    authorize @instrument
    if @instrument.update(instrument_params)
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
    instrument = Instrument.find(params[:id])
    authorize instrument
    instrument.destroy
    redirect_to instruments_path
  end

  private

  def instrument_params
    params.require(:instrument).permit(:name, :photo, :description, :price, :category, :city)
  end
end
