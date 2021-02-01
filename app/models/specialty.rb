class Specialty < ApplicationRecord
    has_many :user_specialties
    has_many :attentions
end
