class Course < ActiveRecord::Base
  belongs_to :dish
  belongs_to :feast
end
