class UserSpecialtiesController < InheritedResources::Base

  private

    def user_specialty_params
      params.require(:user_specialty).permit(:user_id, :specialty_id)
    end

end
