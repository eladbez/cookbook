class Messege < ActiveRecord::Base
   belongs_to :sender, :foreign_key 'sender_id', :class_name =>'user' 
   has_many :receivers, :through => :mails 
   
   validates_presence_of :sender_id
   validates_presence_of :receiver_id 
   
   #scope :in_receiver, where(user[0] =>session [:user_id]).order("updated_at desc")
   #scope :in_sender , where(user_id[0]=>sesion[:user_id]).lambda{|quary| where(user_id[1] LIKE ? , "%{quary}")}.order("updated_at desc")
   #hopfolly updated_at should be also creation time...
   #scope :out_sender, where (user[1] => session[:user_id]).order("updated_at desc")
   #scope :out_sender , where(user_id[1]=>sesion[:user_id]).lambda{|quary| where(user_id[0] LIKE ? , "%{quary}")}.order("updated_at desc")
     
   
end
