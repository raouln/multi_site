class Army < ActiveRecord::Base
  belongs_to :owner, :class_name => "User"
  has_and_belongs_to_many :miniatures #, :through => :armies_miniatures, :source => :miniatures
    
end
