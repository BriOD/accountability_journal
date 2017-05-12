class EntriesController < ApplicationController


  def index
    @entries = current_user.entries
  end


  def new
    @journal = current_user.journal
    @entry = @journal.entries.build
  end

  def create
    @journal = current_user.journal
    @entry = @journal.entries.build(entry_params)
    if @entry.save
      redirect_to entry_path(@entry)
    else
      redirect_to journal_path(@journal)
    end
  end

  def show
    @entry = Entry.find_by_id(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @entry}
    end
  end

  def next
    @entry = Entry.find_by_id(params[:id])
    @next_entry = @entry.next
    render json: @next_entry
  end


  private

  def entry_params
    params.require(:entry).permit(:date)
  end
end
