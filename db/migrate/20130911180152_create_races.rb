class CreateRaces < ActiveRecord::Migration
  def change
    
    create_table :races do |t|
      t.string :name, :null => false
      t.timestamps
    end
    
    Race.create(:name => "Orcs") 
    Race.create(:name => "Chaos")
    Race.create(:name => "Dwarfs")
    Race.create(:name => "Empire")
    
    add_column :armies, :race_id, :integer, :default => nil
    
  end
  
end
