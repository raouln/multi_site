class Unit < ActiveRecord::Base
  has_attached_file :picture, 
                    :styles => {  :medium => "300x300>", 
                                  :thumb  => "100x100>" }

  has_and_belongs_to_many :armies
  belongs_to :race
  belongs_to :unit_type
  has_one :stats, :class_name => "UnitStat"
  validates_presence_of :name, :unit_type, :race_id
  
  def army_names
    self.armies.blank? ? "< none >" : self.armies.map(&:name).join(", ")
  end
  
  def race_name
    self.race.blank? ? "none" : self.race.name
  end
  
end
