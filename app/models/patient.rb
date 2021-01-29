class Patient < ApplicationRecord
  #belongs_to :user
  has_many :attentions
end
