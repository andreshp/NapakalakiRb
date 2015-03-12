######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################


# This class contains the data related to the prizes in Napakalaki game.
# 
# @author andreshp, jlsuarez
class Prize

    # Gets treasures or levels in the prize.
    attr_reader :treasures, :levels

    # Initialize method. 
    # Initializes treasures and levels.
    #
    # @param treasures [int] Amount of treasures bonus.
    # @param levels    [int] Amount of levels bonus.
    def initialize(treasures, levels)
        @treasures = treasures
        @levels = levels
    end

    # Gets a string with the prize's info.
    # @return string with information.
    def toString
        "Treasures = #{@treasure}, Levels = #{@levels}"
    end

end
