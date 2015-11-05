class SearchController < ApplicationController
  def search
    @trips = Trip.search(params[:search])
    @entries = Entry.search(params[:search])
  end
  
end
