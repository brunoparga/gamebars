class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_bar, only: %i[show edit update destroy]

  def index
    @bars = Bar.all
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
    params.require(:bar).permit(:name, :address)
  end
end
