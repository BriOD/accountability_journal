class JournalsController < ApplicationController

  def index
    @journals = Journal.all
  end

  def new
    @journal = current_user.build_journal
  end

  def create
    journal = current_user.build_journal(journal_params)
    if journal.save
      redirect_to new_daily_activity_path
    else
      redirect_to new_journal_path
    end
  end

  def show
    @journal = Journal.find_by_id(params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @journal}
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:name)
  end
end
