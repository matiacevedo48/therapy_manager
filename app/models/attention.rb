class Attention < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  belongs_to :specialty

  def self.specialties_attentions(user)
    chart_data = []
    user_specialties = user.specialties
    user_specialties.each { |ue| chart_data.append({ "#{ue.name}": Attention.where(speciality: ue, user: user).count })}
  end
end
