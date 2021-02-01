class SchedulesController < InheritedResources::Base

  private

    def schedule_params
      params.require(:schedule).permit(:name, :user_id)
    end

end
