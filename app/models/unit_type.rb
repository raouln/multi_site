class UnitType < ActiveRecord::Base
    has_many :units
    
    def self.selectable_options
      return UnitType.all.map{|r| [r.name, r.id]}
    end

end
