class EntriesController < ApplicationController
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
  end

  private

  def entry_params
    params.require(:entry).permit(:date)
  end
end
