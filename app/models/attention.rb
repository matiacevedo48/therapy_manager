class Attention < ApplicationRecord
  belongs_to :patient
  belongs_to :user
  belongs_to :specialty

  validates :specialty, :treatment, :symptom, presence: true

  def self.specialties_attentions(user)
    chart_data = {}
    user_specialties = user.specialties
    user_specialties.each { |ue| chart_data.merge!({ "#{ue.name}": Attention.where(user: user, specialty: ue).count })}
    chart_data
  end
end
