#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require "singleton"

# Module Model.
# Napakalaki game's model.
module Model
    # Dice Class.
    # This class has all the information related to the treasures
    # in Napakalaki game.
    #
    # @author andreshp, jlsuarez
    class Dice

        # Include the Singleton Module
        include Singleton

        # Roll the dice and returns an aleatory integer between 1 and 6
        def nextNumber
            Random.rand 1..6
        end
    end
end