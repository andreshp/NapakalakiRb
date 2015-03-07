######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

# Monster Class.
# This class has all the information related to the monsters
# in Napakalaki game.
# 
# @author andreshp, jlsuarez
#
class Monster
        
    # Gets name of the monster.
    attr_reader :name

    # Gets the combat level of the monster.
    attr_reader :combatLevel

    # Initialize method.
    # Initializes name, combatlevel, prize, badCons.
    # @param name Monster's name.
    # @param level Monster's level.
    # @param bc Bad consequence.
    # @param prize Prize.
    def initialize(name, level, bc, prize)
        @name = name
        @combatLevel = level
        @prize = prize
        @badCons = bc
    end

    # Gets a string with the monster's info.
    # @return string with information.
    def toString
       "Name = " + name + "\nLevel = " + combatLevel.to_s + "\nPrize = [" + prize.toString + "] \nBad Consequence = [" + badCons.toString + "]"
    end
end