class ActivityAccountsController < ApplicationController

  def create
    @entry = Entry.find_by_id(params[:entry_id])
    @activity_account = @entry.activity_accounts.build(activity_params)
    if @activity_account.save
      respond_to do |f|
        f.json {render :json => @activity_account}
        f.html {redirect_to entry_path(@entry)}
      end
    else
      redirect_to entry_path(@entry)
    end
  end

  private
  def activity_params
    params.require(:activity_account).permit(:daily_activity, :completion, :duration, :notes)
  end
end
