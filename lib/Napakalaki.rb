#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require "singleton"

require_relative "../lib/CardDealer.rb"
require_relative "../lib/Player.rb"

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
      if @currentPlayer == nil
        @currentPlayerIndex = Random.rand(@players.size)
        @currentPlayer = @players[@currentPlayerIndex]
      else
        @currentPlayerIndex = (@currentPlayerIndex+1) % @players.size
        @currentPlayer = @players[@currentPlayerIndex]
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

    # Indicates to the current player that the combat with current monster
    # must be performed. For that purpose, calls the combat method
    # for that player.
    # @return A CombatResult enum with the result of the combat.
    def combat
      @currentPlayer.combat(@currentMonster)
      CardDealer.instance.giveMonsterBack(currentMonster)
    end

    # Deletes the visible treasures indicated from the player's visible treasures list.
    # If the player has a pending bad consequence, it is actualized.
    # @param t [Treasure] List with the visible treasures to delete.
    def discardVisibleTreasure(t)
      @currentPlayer.discardVisibleTreasure(t)
    end
    
    # Deletes the hidden treasures indicated from the player's hidden treasures list.
    # If the player has a pending bad consequence, it is actualized.
    # @param t [Treasure] List with the hidden treasures to delete.
    def discardHiddenTreasure(t)
      @currentPlayer.discardHiddenTreasure(t)
    end

    # Makes a given hidden treasure visible for the current player.
    # Checks if the treasure can be made visible and if so do it.
    # @param t [Treasure] Treasure to make visible.
    # @return True if the treasure has been made visible. False otherwise.
    def makeTreasureVisible(t)
      @currentPlayer.makeTreasureVisible(t)
    end
    
    # Given a list of visible and hidden treasures, check how many levels can buy the
    # current player with those treasures and, if he does not win the game, do the
    # operation. To accomplish this action the method calls to currentPlayer.buyLevels. 
    # @param visible [Treasure []] Visible treasures to exchange for levels.
    # @param hidden [Treasure []] Hidden treasures to exchange for levels.
    # @return Boolean which indicates if the levels has been bought.
    def buyLevels(visible, hidden)
      @currentPlayer.buyLevels(visible,hidden)
    end

    # Requests to CardDealer initializing the cards' decks. 
    # Initializes the players and starts the game calling nextTurn method.
    # @param players [String []] Players names
    def initGame(players)
      # Initializes the cards and the players
      CardDealer.instance.initCards
      initPlayers(players)
      # Initializes currentPlayer and calls next turn
      @currentPlayerIndex = Random.rand(players.size)
      @currentPlayer = @players[@currentPlayerIndex]
      nextTurn
    end
        
    # Checks if a given hidden treasure can be made visible f
    # or the current player.
    # @param t [Treasure] Treasure to check.
    # @return True if the treasure can be made visible. False otherwise.
    def canMakeTreasureVisible(t)
      @currentPlayer.canMakeTreasureVisible(t)
    end

    # Gets the current player visible treasures
    # @return Array with the visible treasures
    def getVisibleTreasures
      @currentPlayer.visibleTreasures
    end
    
    # Gets the current player hidden treasures
    # @return Array with the hidden treasures
    def getHiddenTreasures
      @currentPlayer.hiddenTreasures    
    end
    
    # Verifies if the current player has already finished his turn. 
    # In that case a new currentPlayer is asigned and a new monster is
    # taken from the monsters deck.
    # If the new curent player is dead or it is his first turn then
    # his treasures are initialized.
    # @return True if it was possible to begin a new turn. False otherwise.
    def nextTurn
      isNextTurnAllowed = nextTurnAllowed
      if isNextTurnAllowed
        @currentPlayer = nextPlayer
        @currentPlayer.initTreasures if @currentPlayer.isDead
        @currentMonster = CardDealer.instance.nextMonster
      end
      isNextTurnAllowed
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

    #----------------- GET METHODS FOR GAMETESTER -----------------#

    def getCurrentPlayer
      @currentPlayer
    end
    def getCurrentMonster
      @currentMonster
    end
  end
end