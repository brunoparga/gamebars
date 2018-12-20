class PagesController < ApplicationController
  def home
    @bars = Bar.all
    @games = BoardGame.all
  end
end
