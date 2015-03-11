#encoding: utf­8

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
class Monster

    # Gets name of the monster.
    attr_reader :name

    # Gets the combat level of the monster.
    attr_reader :combatLevel

    # Initialize method.
    # Initializes name, combatlevel, prize, badCons.
    # @param name [string] Monster's name.
    # @param level [int] Monster's level.
    # @param bc [BadConsequence] Bad consequence of losing to the monster.
    # @param prize [Prize] Prize for winning to the monster.
    def initialize(name, level, bc, prize)
        @name = name
        @combatLevel = level
        @prize = prize
        @badCons = bc
    end

    # Gets a string with the monster's info.
    # @return string with information.
    def toString
        "Name = #{@name}\nLevel = #{@combatlevel}\nPrize = [" + @prize.toString + "] \nBad Consequence = [\n" + @badCons.toString(10) + "\n]"
    end
end