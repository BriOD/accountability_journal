class DailyActivitiesController < ApplicationController
  def new
    @activity = DailyActivity.new
  end

  def create
    # raise params.inspect
    activity = current_user.daily_activities.build(daily_activity_params)
    if activity.save
      redirect_to user_path(current_user)
    else
      redirect_to new_daily_activity_path
    end
  end

  def show
    @activity = DailyActivity.find_by_id(params[:id])
  end

  private

  def daily_activity_params
    params.require(:daily_activity).permit(:name, :description)
  end

end
