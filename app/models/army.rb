class Army < ActiveRecord::Base
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  has_and_belongs_to_many :miniatures #, :through => :armies_miniatures, :source => :miniatures

  belongs_to :race
end
