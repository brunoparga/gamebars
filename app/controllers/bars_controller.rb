class BarsController < ApplicationController
  def index
    @bars = Bar.all
  end

  def new
    @bar = Bar.new
  end
end
