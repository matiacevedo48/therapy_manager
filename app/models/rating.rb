class Rating < ApplicationRecord
  #validates_inclusion_of :value, :in => 1..10
  belongs_to :user
  validates_inclusion_of :rating, :in => 1..10
end