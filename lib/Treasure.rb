#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/TreasureKind.rb'

# Module Model.
# Napakalaki game's model.
module Model
    # Treasure Class.
    # This class has all the information related to the treasures
    # in Napakalaki game.
    #
    # @author andreshp, jlsuarez
    class Treasure
    
        # Getters name of the treasure, its gold coins, the min and max bonus and type of treasure.
        attr_reader :name, :goldCoins, :minBonus, :maxBonus, :kind
    
        # Initialize method.
        # Initializes name, goldCoins, minBonus, maxBonus.
        # @param name [string] Treasure's name.
        # @param gold [int] Treasure value in gold coins.
        # @param min  [int] Minimum bonus of the treasure.
        # @param max  [int] Maximum bonus of the treasure. It is applied with a NECKLACE.
        # @param kind [TreasureKind] Kind of treasure.
        def initialize(name, gold, min, max, kind)
            @name = name
            @goldCoins = gold
            @minBonus = min
            @maxBonus = max
            @kind = kind
        end
    
        # Gets a string with the treasure's info.
        # @return string with information.
        def to_s
            "Name = #{@name}\nGold Coins = #{@goldCoins}\nMinimum Bonus = #{@minBonus}\nMaximum Bonus = #{@maxBonus}\nKind of the Treasure = #{@kind.upcase}"
        end
    end
end