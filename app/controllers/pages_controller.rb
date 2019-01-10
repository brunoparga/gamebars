class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    @bars = Bar.all
    @games = BoardGame.all
  end
end
