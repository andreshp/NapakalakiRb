#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

# Napakalaki class
# Main class of Napakalaki game.
#
# @author andreshp, jlsuarez

require "singleton"

class Napakalaki

    include Singleton

    def initPlayers(names)
        
    end

    def nextPlayer
        @currentPlayer#Index
    end

    def self.getInstance
        @@instance
    end

    def combat

    end

    def discardVisibleTreasure(t)

    end

    def discardHiddenTreasure(t)

    end

    def makeTreasureVisible(t)

    end

    def buyLevels(visible, hidden)

    end

    def initGame(players)

    end

    def getCurrentPlayer
        @currentPlayer
    end

    def getCurrentMonster
        @currentMonster
    end

    def canMakeTreasureVisible(t)

    end

    def getVisibleTreasures

    end

    def getHiddenTreasures

    end

    def nextTurn

    end
    
    def nextTurnAllowed

    end

    def endOfGame(result)

    end

    private_class_method :new :initPlayers :nextPlayer
end
