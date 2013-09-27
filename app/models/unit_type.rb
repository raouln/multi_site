class UnitType < ActiveRecord::Base
    has_many :units
    
    def self.selectable_options
      return UnitType.all.map{|r| [r.name, r.id]}
    end

    def self.unique
      return UnitType.find_by_name("Unique").units
    end

end
