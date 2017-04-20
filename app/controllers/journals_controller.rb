class JournalsController < ApplicationController
  def new
    @journal = current_user.build_journal
  end

  def create
    journal = current_user.build_journal(journal_params)
    if journal.save
      redirect_to journal_path(journal)
    else
      redirect_to new_journal_path
    end
  end

  def show
    @journal = Journal.find_by_id(params[:id])
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end
end
