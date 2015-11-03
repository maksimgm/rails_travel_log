class EntriesController < ApplicationController
	before_action :confirm_logged_in

  def index
  	@entries = Entry.all
  end

  def new
    @trip = Trip.find(:trip_id)
  	@entry = Entry.new
  end  

  def create
  	@trip = Trip.find(:trip_id)

  	@entry = @trip.build entry_params

  	if @entry.save
  		flash[:success] = "Entry created"
  		redirect_to @trip
  	else
  		render :new
  	end
  end

  def edit
  	@entry = Entry.find(params[:id])
  end

  def update
  	@entry = Entry.find(params[:id])

  	if @entry.update(entry_params)
  		flash[:updated] = "Entry Updated"
  		redirect_to @entry
  	else
  		render :edit
  	end
  end

  def destroy

  	@entry = Entry.find(params[:id])
  	@entry.destroy

  	# where to redirect_to?
  	redirect_to @entry.trip
  end

  private

  def entry_params
		params.require(:entry).permit(:title, :location, :summary, :cost, :image, :video_url)
  end
end
