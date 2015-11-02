class EntriesController < ApplicationController
  def index
  	@entries = Entry.all
  end

  def new
  	@entry = Entry.new
  end  

  def create
  	@entry = Entry.new entry_params

  	if @entry.save
  		flash[:success] = "Entry created"
  		redirect_to user_trip_entries_path
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
  end

  def destroy
  	@entry = Entry.find(params[:id])
  	@entry.destroy

  	# where to redirect_to?
  	# redirect_to user_trip_entries_path
  end

  private

  def entry_params
		params.require(:entry).permit(:title, :location, :summary, :cost, :image, :video_url)
  end
end
