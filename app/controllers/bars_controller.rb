class BarsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  
  def index
    @bars = Bar.all
  end

  def new
    @bar = Bar.new
  end
end
