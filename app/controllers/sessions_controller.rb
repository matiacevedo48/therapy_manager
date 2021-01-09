class SessionsController < InheritedResources::Base

  private

    def session_params
      params.require(:session).permit(:patient_id, :user_id, :therapy, :treatment, :date, :time, :symptom)
    end

end
