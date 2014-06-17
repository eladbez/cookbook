class Mail < ActiveRecord::Base
  belongs_to :in_messege, :foreign_key 'in_messege_id', :class_name =>'messege'
  belongs_to :receivers, :foreign_key 'receiver_id', :class_name =>'user' 
  
end
