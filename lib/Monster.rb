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

    # Gets Prize of the monster.
    attr_reader :prize

    #Gets Bad Consequences of the monster.
    attr_reader :badCons

    # Initialize method.
    # Initializes name, combatlevel, prize, badCons.
    # @param name  [string] Monster's name.
    # @param level [int] Monster's level.
    # @param bc    [BadConsequence] Bad consequence of losing to the monster.
    # @param prize [Prize] Prize for winning to the monster.
    def initialize(name, level, bc, prize)
        @name = name
        @combatLevel = level
        @badCons = bc
        @prize = prize
    end

    # Gets a string with the monster's info.
    # @return string with information.
    def to_s
        "Name = #{@name}\nLevel = #{@combatLevel}\nPrize = [" + @prize.to_s + "] \nBad Consequence = [\n" + @badCons.to_s(10) + "\n]"
    end
end