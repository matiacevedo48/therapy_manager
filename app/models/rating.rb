class Rating < ApplicationRecord
  #validates_inclusion_of :value, :in => 1..10
  belongs_to :user
end