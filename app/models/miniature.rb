class Miniature < ActiveRecord::Base
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  has_and_belongs_to_many :armies #, :through => :armies_miniatures, :source => :army
  validates_presence_of :name, :war_type
  
end
