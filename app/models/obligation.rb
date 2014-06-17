class Obligation < ActiveRecord::Base
  belongs_to :dish
  belongs_to :participation
end
