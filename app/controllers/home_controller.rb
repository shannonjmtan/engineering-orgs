class HomeController < ApplicationController

  def home; end

  def list
    @clubs = Club.all
  end

  def about; end

  def calendar; end

  def club
    @club = Club.find(params[:id])
  end

end
