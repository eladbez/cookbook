class Feast < ActiveRecord::Base

  mount_uploader :image, ImageUploader
  
    
  has_many :participations, dependent: :destroy
  has_many :users, :through => :participations
  
  has_many :courses, dependent: :destroy
  has_many :dishes, :through => :courses
  
  has_many :feast_invt, dependent: :destroy
  
  accepts_nested_attributes_for :participations,
  :allow_destroy => true
  
  accepts_nested_attributes_for :courses,
  :allow_destroy => true
  
  
  validates_presence_of :feast_time
  validates_presence_of :feast_place
  
  
end
