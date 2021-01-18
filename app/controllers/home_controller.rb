class HomeController < ApplicationController
  def index
    if signed_in?
      
    else
      
    end
  end
    
      
    
  def profile
    if current_user.present?
          
    else
      redirect_to new_user_session_path
    end
  end
    
end