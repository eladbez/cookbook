class FeastInvt < ActiveRecord::Base
   belongs_to :invitable, polymorphic: true
 end
