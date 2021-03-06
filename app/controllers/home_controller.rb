class HomeController < ApplicationController
  def index
    @rating_promedio = Rating.average(:rating) || 0
    @rating_promedio = @rating_promedio.round(1)
    
    @patients = Patient.all
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @patients = Patient.where(name: @name)
    end
    
  end
   
      
    
  def profile
    if current_user.present?
          
    else
      redirect_to new_user_session_path
    end
  end
 
    
end