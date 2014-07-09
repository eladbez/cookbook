class User < ActiveRecord::Base
  
  require 'digest/sha1'
  mount_uploader :image, ImageUploader
  
  has_many :participations, dependent: :destroy
  has_many :feasts, :through => :participations
  
  has_many :belongings
  has_many :dishes, :through=>:belongings
  
  has_many :mails
  has_many :in_messeges, :through => :mails
  
  has_many :out_messeges, :class_name => 'messege', :foreign_key => 'sender_id'
  
  has_many :s_friend_invt, :class_name => 'friend_invt' , :foreign_key => 'sender_id'
  has_many :in_friend_invt, :class_name => 'friend_invt' , :foreign_key => 'receiver_id'
  
  has_many :s_feast_invt, :class_name => 'feast_invt' , :foreign_key => 'sender_id' 
  has_many :in_feast_invt, :class_name => 'feast_invt' , :foreign_key => 'receiver_id'
  
  has_many :friendships
  has_many :friends, :through => :friendships 
  # the friendship option needs creation. first see the advanced 
  # rails course to understand the build function in the instruction movie bookmark  
  
 
  
 
  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
 

if false    
  validates :name,:presence => true, 
                  :length => { :maximum => 25 }
                 
  
  validates :email,:presence => true, 
                   :length => { :maximum => 100 },
                   :uniqueness => true 
                   #,:format => EMAIL_REGEX 
   
   
   validates :password, :confirmation => true,
                        :length => {:within => 8..25},
                        :on => :create  
   
   validates :street_num, 
             presence: true, 
             :length => {maximum: 100}
   
    
   validates :kosher?, presence: true
      
 end
    
   before_save :create_hashed_password
   after_save :clear_password

   scope :sorted, -> {order("name ASC")}
   scope :search, lambda{|query| where(["name LIKE ?", "%#{query}%"])} 
  
   
   def self.authenticate(name="", password="")
    user = User.find_by name: "#{name}"
    if user && user.password_match?(password) #password_match is a name of a method later to be specified
      return user
    else
      return false
    end
   end
   
    # The same password string with the same hash method and salt
  # should always generate the same hashed_password.
  def password_match?(password="")
    hashed_password == User.hash_with_salt(password, salt)
  end
  
  def self.make_salt(name="")
    Digest::SHA1.hexdigest("Use #{name} with #{Time.now} to make salt")
  end
  
  def self.hash_with_salt(password="", salt="")
    Digest::SHA1.hexdigest("Put #{salt} on the #{password}")
  end
  
  private
  
  def create_hashed_password
    # Whenever :password has a value hashing is needed
    unless password.blank?
      # always use "self" when assigning values
      self.salt = User.make_salt(self.name) if self.salt.blank?
      self.hashed_password = User.hash_with_salt(self.password, self.salt)
    end
  end

  def clear_password
    # for security and b/c hashing is not needed
    self.password = nil
  end
  
   
end
