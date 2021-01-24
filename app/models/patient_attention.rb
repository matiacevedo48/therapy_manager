class PatientAttention < ApplicationRecord
    belongs_to :patient
    belongs_to :attention
  
  end
  