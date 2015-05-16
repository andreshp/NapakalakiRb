#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative 'CultistPlayer.rb'

# Module Model.
# Napakalaki game's model.
module Model
  # Cultist class.
  # Class that represents a cultist in Napakalaki game.
  class Cultist
  public
    # Constructor
    # @param name Cultist name
    # @param gainedLevels Gained Levels as consequence of cultist.
    def initialize(name,gainedLevels)
        @name = name
        @gainedLevels = gainedLevels
    end

    # Get the basic value for the cultist card.
    def getBasicValue
        @gainedLevels
    end

    # Get the special value for the cultist card.
    def getSpecialValue
        return getBasicValue*CultistPlayer.getTotalCultistPlayers
    end

    def to_s
      puts = "Name = #{@name}, Gained Levels = #{@gainedLevels}"
    end
  end
end