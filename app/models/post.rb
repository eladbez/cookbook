class Post < ActiveRecord::Base

belongs_to :postable, :polymorphic => true
has_many :replies, dependent: :destroy



end
