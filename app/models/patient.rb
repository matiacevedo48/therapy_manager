class Patient < ApplicationRecord
  has_many :attentions

  def fullname
    name + " " + (last_name || "")
  end
end
