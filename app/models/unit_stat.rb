class UnitStat < ActiveRecord::Base
  belongs_to :unit

  @@fields = [
    ['M',   'move'],
    ['WS',  'weapon_skill'],
    ['BS',  'ballistic_skill'],
    ['S',   'strength'],
    ['T',   'toughness'],
    ['I',   'initiative'],
    ['W',   'wounds'],
    ['A',   'attack'],
    ['Ld',  'leadership']
  ]

  def ws
    self.weapon_skill
  end

  def self.fields
    return @@fields
  end

end