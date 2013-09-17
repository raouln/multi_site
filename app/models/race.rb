class Race < ActiveRecord::Base
  has_many :armies
  
  def self.selectable_options
    return Race.all.map{|r| [r.name, r.id]}
  end
  
end
