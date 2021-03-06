class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_bar, only: %i[show edit update destroy]

  def index
    @city = params[:city].titleize
    city_bars = Bar.where(city: @city)
    @found_bars = !city_bars.empty?
    @bars = @found_bars ? city_bars : Bar.all
  end

  def show; end

  def new
    @bar = Bar.new
  end

  def create
    @bar = current_user.owned_bars.build(bar_params)
    @bar.save ? redirect_to(@bar) : render(:new)
  end

  def edit; end

  def update
    @bar.update(bar_params) ? redirect_to(@bar) : render(:edit)
  end

  def destroy
    @bar.destroy
    redirect_to root_path
  end

  private

  def set_bar
    @bar = Bar.find(params[:id])
  end

  def bar_params
    params.require(:bar).permit(:name, :address, :city, :opening_hours)
  end
end
