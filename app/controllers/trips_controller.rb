class TripsController < ApplicationController
  before_action :confirm_logged_in


  def index
    @user = User.find_by_id params[:user_id]
    # @user_trips = @user.trips
    @trips = @user.trips
    # @hash = Gmaps4rails.build_markers(@trips) do |trip, marker|
    #   marker.lat trip.latitude
    #   marker.lng trip.longitude
    #   marker.json({:id => trip.id})
    #   # marker.infowindow trip.entries
  
  
  end


  def new
    @user = User.find_by_id params[:user_id]
    @trip = Trip.new
  end

  def create
    @user = User.find_by_id params[:user_id]
    @trip = @user.trips.build trip_params
    if @trip.save
      flash[:success] = "Trip created successfully"
      redirect_to @trip
    else
      render :new
    end
  end

  def show
    @trip = Trip.find_by_id params[:id]
    @entry = Entry.new
  end

  def edit
    @trip = Trip.find_by_id params[:id]
  end

  def update
    @trip = Trip.find_by_id params[:id]
    if @trip.update trip_params
      flash[:success] = "Trip updated successfully"
      redirect_to @trip
    else
      render :edit
    end
  end


  def destroy
    @trip = Trip.find_by_id params[:id]
    @trip.destroy
    redirect_to user_trips_path(@trip.user), notice:"Trip Deleted"
  end

  private
  def trip_params
    params.require(:trip).permit(:title, :location,:duration,:summary,:budget,:video_url)
  end


end
