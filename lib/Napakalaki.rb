#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require "singleton"

# Module Model.
# Napakalaki game's model.
module Model

  # Napakalaki class
  # Main class of Napakalaki game.
  #
  # @author andreshp, jlsuarez
  class Napakalaki
  
    include Singleton

    # Gets methods for attributes currentPlayer and currentMonster
    attr_reader :currentPlayer, :currentMonster

    #----------------- PRIVATE METHODS -----------------#
    private

    # Initializes the players.
    # 
    # For each name in names, makes a new player and 
    # adds it to players.
    # @param names [String []] Players names
    def initPlayers(names)
      names.each do |name|
        @players << Player.new(name)
      end
    end

    # Decides which is the next player to play.
    # If it is the first turn of the game, the player is chosen at random.
    # If it isn't, the player is the one to currentPlayer's right in the
    # array players.
    def nextPlayer
      if @currentPlayer = nil
        @currentPlayer = Random.rand(1..3)
      else
        @currentPlayerIndex = (@currentPlayerIndex+1) % @players.size
        @currentPlayer = players[@currentPlayerIndex]
      end
      @currentPlayer
    end

    # Initializes the attributes currentPlayer, 
    # currentPlayerIndex, currentMonster y players.
    def initialize
      @currentPlayer = nil
      @currentPlayerIndex = -1
      @currentMonster = nil
      @players = []
    end

    #----------------- PUBLIC METHODS -----------------#
    public

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
        
    def canMakeTreasureVisible(t)
    
    end
    
    def getVisibleTreasures
    
    end
    
    def getHiddenTreasures
    
    end
    
    def nextTurn
    
    end
    
    # Check if the current player can pass the turn.
    # A player can pass the turn if he has a valid state.
    def nextTurnAllowed
      @currentPlayer.validState
    end
    
    # If the given result of the combat is WINANDWINGAME
    # then return true. Else return false.
    # @param Result of the combat
    # @return Boolean checking if the game has finished.
    def endOfGame(result)
        result == CombatResult::WINANDWINGAME
    end
  end
end