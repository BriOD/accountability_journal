class ActivityAccountsController < ApplicationController

  def create
    @entry = Entry.find_by_id(params[:entry_id])
    @activity_account = @entry.activity_accounts.build(activity_params)
    if @activity_account.save
      redirect_to entry_path(@entry)
    else
      render :entry_path
    end
  end

  private
  def activity_params
    params.require(:activity_account).permit(:daily_activity, :completion, :duration, :notes)
  end
end
