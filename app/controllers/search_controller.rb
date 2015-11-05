class SearchController < ApplicationController
  def search
    @trips = Trip.search(params[:search])
  end
  
end
