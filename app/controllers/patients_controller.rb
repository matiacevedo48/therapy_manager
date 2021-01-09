class PatientsController < InheritedResources::Base

  private

    def patient_params
      params.require(:patient).permit(:user_id, :name, :last_name, :rut, :phone_number, :email, :birthdate, :job, :civil_state, :family_info, :illness, :allergies, :surgery, :hobbies)
    end

end
