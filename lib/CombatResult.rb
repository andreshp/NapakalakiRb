#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

# Combat Result enumerate.
# It has symbols for each possible situation after a combat in Napakalaki game.
#
# @author andreshp, jlsuarez
module CombatResult
    WINANDWINGAME = :winandwingame
    WIN = :win
    LOSE = :lose
    LOSEANDESCAPE = :loseandescape
    LOSEANDDIE = :loseanddie
end