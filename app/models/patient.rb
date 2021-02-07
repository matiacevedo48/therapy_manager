class Patient < ApplicationRecord
  has_many :attentions

  validates :name, :last_name, :rut, :phone_number, :email, :birthdate, :civil_state, :family_info, presence: true

  def fullname
    name + " " + (last_name || "")
  end
end
