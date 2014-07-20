class FeastInvt < ActiveRecord::Base
   belongs_to :sender, class_name: 'User'
   belongs_to :receiver, class_name: 'User'
   belongs_to :feast
   has_many :posts, as: :postable, dependent: :destroy  
 end
