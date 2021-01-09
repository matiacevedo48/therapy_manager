class AgendasController < InheritedResources::Base

  private

    def agenda_params
      params.require(:agenda).permit(:available, :taken, :patient_id)
    end

end
