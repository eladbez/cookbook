class FriendInvt < ActiveRecord::Base
  belongs_to :sender, :foreign_key 'sender_id', :class_name =>'user'
  belongs_to :receiver, :foreign_key 'receiver_id', :class_name =>'user'

end
