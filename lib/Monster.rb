#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/BadConsequence.rb'
require_relative '../lib/Prize.rb'

# Module Model.
# Napakalaki game's model.
module Model
  # Monster Class.
  # This class has all the information related to the monsters
  # in Napakalaki game.
  #
  # @author andreshp, jlsuarez
  class Monster

    # Gets methods for monster's name, combat level, prize and bad consequence.
    attr_reader :name, :combatLevel, :prize, :badCons

    # Initialize method.
    # Initializes name, combatlevel, prize, badCons.
    # @param name  [string] Monster's name.
    # @param level [int] Monster's level.
    # @param bc    [BadConsequence] Bad consequence of losing to the monster.
    # @param prize [Prize] Prize for winning to the monster.
    def initialize(name, level, bc, prize, levelChange = 0)
      @name = name
      @combatLevel = level
      @badCons = bc
      @prize = prize
      @levelChangeAgainstCultistPlayer = levelChange
    end

    #Get the basic value for the monster card.
    def getBasicValue
      combatLevel 
    end

    #Get the special value for the monster card.
    def getSpecialValue
      combatLevel + @levelChangeAgainstCultistPlayer
    end


    # Gets a string with the monster's info.
    # @return string with information.
    def to_s
      "Name = #{@name}\nLevel = #{@combatLevel}\nCultist Change Level = #{@levelChangeAgainstCultistPlayer}\nPrize = [" + @prize.to_s + "] \nBad Consequence = " + @badCons.to_s() + "\n"
    end
  end
end