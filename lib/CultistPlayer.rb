#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative 'Player.rb'

# Module Model.
# Napakalaki game's model.
module Model
  # Cultist Player class.
  # Class that extends the class Player introducing a new kind  of player
  # that can be obtained in some situations of Napakalaki game.
  class CultistPlayer
    #Static attribute that shows the current number of cultist players.
    @@totalCultistPlayers = 0

    protected

    # @see Player::ShouldConvert
    def shouldConvert
        false
    end

    # @see Player::getOponentLevel
    def getOponentLevel(monster)
      monster.getSpecialValue
    end

    # @see Player::computeGoldCoinsValue
    def computeGoldCoinsValue(treasures)
      super*2
    end
    
    public

    # Constructor
    # @param player Player to make cultist.
    # @param cultist Cultist card to apply to the player.
    def initialize(player,cultist)
        super
        @myCultistCard = cultist
        totalCultistPlayers += 1
    end

    #Get the combat level for a cultist player.
    def getCombatLevel
      super + @myCultistCard.getSpecialValue
    end



    
  end
end