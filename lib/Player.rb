#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative "../lib/Treasure.rb"
require_relative "../lib/Dice.rb"
require_relative "../lib/BadConsequence.rb"
require_relative "../lib/CardDealer.rb"
require_relative "../lib/CombatResult.rb"

# Module Model.
# Napakalaki game's model.
module Model

  # Player Class.
  # This class has all the information related to the players
  # in Napakalaki game.
  #
  # @author andreshp, jlsuarez
  class Player

    # Getters name of the player, if he is dead, his level and his visible and hidden treasures.
    attr_reader :dead, :name, :level, :visibleTreasures, :hiddenTreasures

    @@MAXHIDDENTREASURES = 4

    # Initialize method.
    # Initializes the player's name, level and treasures.
    # @param name [string] Player's name.
    def initialize(name)
      @name = name
      @level = 1
      @dead = true
      @hiddenTreasures = []
      @visibleTreasures = []
      @pendingBadConsequence = nil
    end

    #-------------- PRIVATE METHODS --------------#
    
    private

    # Bring player to life
    def bringToLife
      @dead = false
    end
    
    # Increase the level of the player
    # @param levels [int] Levels to increase.
    def increaseLevels(levels)
      @level += levels
    end
    
    # Decrease the level of the player
    # @param levels [int] Levels to decrease.
    def decreaseLevels(levels)
      @level = @level - levels >= 1? @level-levels : 1 
    end
    
    # Set a bad consequence as pending.
    # @param badCons [BadConsequence] Bad Consequence to assign as pending.
    def setPendingBadConsequence(badCons)
      @pendingBadConsequence = badCons
    end
    
    # The player dies.
    # His new level is 1 and every player's treasure
    # is given back.
    def die
      @dead = true
      @level = 1
      @visibleTreasures.each {|t| CardDealer.instance.giveTreasureBack(t)}
      @visibleTreasures.clear
      @hiddenTreasures.each {|t| CardDealer.instance.giveTreasureBack(t)}
      @hiddenTreasures.clear
    end
    
    # Discard the necklace if it is a visible treasure.
    def discardNecklaceIfVisible
      @visibleTreasures.each do |vt|
        if vt.kind == TreasureKind::NECKLACE
          CardDealer.instance.giveTreasureBack(vt)
          @visibleTreasures.delete(vt)
          break
        end
      end
    end
    
    # The player dies if he don't have treasures.
    def dieIfNoTreasures
      if @visibleTreasures.empty? and @hiddenTreasures.empty?
        die
      end
    end
    
    # Determine if the player can buy nLevels or not.
    # A player can buy levels if he doesn't win with those levels.
    # @param nLevels [int] Number of levels that the player want to buy.
    def canIBuyLevels(nLevels)
      @level + nLevels < 10
    end
    
    #------------- PROTECTED METHODS -------------#

    protected

    # Method that compute the total amount of levels the player can buy with the given treasures.
    # @param treasures [Array Treasures] Array with the treasures.
    # @return Amount of levels able to buy (not rounded)
    def computeGoldCoinsValue(treasures)
      result = treasures.inject(0){|sum,t| sum += t.goldCoins} / 1000.0
      result
    end
    
    #-------------- PUBLIC METHODS --------------#

    public
    
    # Apply the prize won fighting with a monster.
    # @param [Prize] Prize to apply.
    def applyPrize(prize)
      # Increments the levels
      increaseLevels(prize.levels)
      # Adds the treasures
      prize.treasures.times {@hiddenTreasures << CardDealer.instance.nextTreasure}
    end

    # Combat against a given monster.
    # @param monster [Monster] Monster to fight against.
    def combat(monster)
      # If player's level is greater than monster's level
      # the player wins.
      # Otherwise a dice is rolled. If the dice return 5 or 6
      # the player can scape. Else the player loses the combat.
      if getCombatLevel > monster.combatLevel
        applyPrize(monster.prize)
        combatResult = @level < 10? CombatResult::WIN : CombatResult::WINANDWINGAME
      else
        randomNumber = Dice.instance.nextNumber
        if randomNumber >= 5
          return CombatResult::LOSEANDESCAPE
        elsif monster.badCons.kills
          die
          combatResult = CombatResult::LOSEANDDIE
        else
          applyBadConsequence(monster.badCons)
          combatResult = CombatResult::LOSE
        end
      end
      # Discard the necklace if it is a visible treasure
      discardNecklaceIfVisible
      # Return the combat result
      combatResult
    end

    # Apply the bad consequence given.
    # @param badCons [BadConsequence] Bad Consequence to apply.
    def applyBadConsequence(badCons)
      # Decrement the correesponding levels
      decreaseLevels(badCons.levels)
      # Set the pending bad consequence
      pendingBadCons = badCons.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBadCons)
    end

    # Make a given treasure visible.
    # @param [Treasure] Treasure to make visible.
    def makeTreasureVisible(treasure)
      allowed = canMakeTreasureVisible(treasure)
      if allowed
        @visibleTreasures << treasure
        @hiddenTreasures.delete(treasure)
      end
      allowed
    end

    # Check if the given treasure can be made visible.
    # A treasure can be made visible if in that case the player's visible 
    # treasures verifies the game condition:
    #   "There are no more than one treasure of each kind but ONEHAND, which 2 are 
    #    allowed. There must not be BOTHHANDS and ONEHAND treasures at the same time."
    # @param [Treasure] Treasure to check.
    # @return Boolean with the checking result.
    def canMakeTreasureVisible(treasure)
      tr_types = @visibleTreasures.map(&:kind)
      if @hiddenTreasures.member?(treasure)
        if tr_types.include?(treasure.kind)
          if treasure.kind == TreasureKind::ONEHAND and tr_types.count(TreasureKind::ONEHAND) < 2
            result = true
          else
            result = false
          end
        elsif treasure.kind == TreasureKind::BOTHHANDS and tr_types.include?(TreasureKind::ONEHAND) 
          result = false
        elsif treasure.kind == TreasureKind::ONEHAND and tr_types.include?(TreasureKind::BOTHHANDS) 
          result = false
        else
          result = true
        end
      else
        result = false
      end
      result
    end
        
    # Discard the tresure given if it is visible.
    def discardVisibleTreasure(treasure)
      @visibleTreasures.delete(treasure)
      if @pendingBadConsequence != nil and not @pendingBadConsequence.isEmpty()
        @pendingBadConsequence.substractVisibleTreasure(treasure)
      end
      CardDealer.instance.giveTreasureBack(treasure)
      dieIfNoTreasures
    end

    # Discard the given treasure if it is hidden.
    def discardHiddenTreasure(treasure)
      @hiddenTreasures.delete(treasure)
      if @pendingBadConsequence != nil and not @pendingBadConsequence.isEmpty()
        @pendingBadConsequence.substractHiddenTreasure(treasure)
      end
      CardDealer.instance.giveTreasureBack(treasure)
      dieIfNoTreasures
    end

    # Buy levels for the player.
    # Before finishing the shopping it is checked that the player
    # can buy levels.
    # @param visible [Treasure []] Visible treasures to sell. 
    # @param hidden [Treasure []] Hidden treasures to sell. 
    # @return Boolean which indicates if it was possible to buy levels.
    def buyLevels(visible, hidden)
      levels = computeGoldCoinsValue(visible)
      levels += computeGoldCoinsValue(hidden)
      canBuy = canIBuyLevels(levels)
      if canBuy
        increaseLevels(levels.to_i)
        for t in visible
          discardVisibleTreasure(t)
        end
        for t in hidden
          discardHiddenTreasure(t)
        end
      end
      canBuy
    end

    # Get the combat level of the player.
    # @return Integer with the combat level
    def getCombatLevel
      tr_types = @visibleTreasures.map(&:kind)
      if tr_types.include? TreasureKind::NECKLACE
        return @visibleTreasures.inject(@level){ |sum,x| sum += x.maxBonus }
      else
        return @visibleTreasures.inject(@level){ |sum,x| sum += x.minBonus }
      end
    end
    
    # Check if the player is in a valid state.
    # This means, there isn't a pending bad consequence and the number of 
    # hidden treasures is no more than MAXHIDDENTREASURES.
    # @return Bolean with the result of the check.
    def validState
      (@pendingBadConsequence == nil or @pendingBadConsequence.isEmpty) and @hiddenTreasures.size <= @@MAXHIDDENTREASURES
    end

    # Initializes the player's treasures and bring him to life.
    # The number of treasures given to the player is:
    #  - 1 if the rolled dice returns 1
    #  - 2 if the rolled dice returns t with 1 < t < 6
    #  - 3 if the rolled dice returns 6
    def initTreasures
      bringToLife
      randomNumber = Dice.instance.nextNumber
      numberTreasures = randomNumber == 1? 1 : randomNumber < 6? 2 : 3
      numberTreasures.times {@hiddenTreasures << CardDealer.instance.nextTreasure}
    end

    # Check if the player is dead.
    # @return Bolean that indicates if the player is died or not.
    def isDead
      self.dead
    end

    # Check if the player has visible treasures.
    # @return True if the player has visible treasures and false else.
    def hasVisibleTreasures
      not visibleTreasures.empty?
    end
    
    # To string method for a player.
    # It prints the player's name, level and combat level.
    def to_s
      @name + " Level: " + @level.to_s + " Combat Level: " + getCombatLevel.to_s
    end

    #----------------- GET METHODS FOR GAMETESTER -----------------#

    def getHiddenTreasures
      @hiddenTreasures
    end
    def getVisibleTreasures
      @visibleTreasures
    end
    def getName
      @name
    end

#        def setVisibleTreasureList(treasures)
#            @visibleTreasures = treasures
#        end
#        def setHiddenTreasureList(treasures)
#            @hiddenTreasures = treasures
#        end
  end
end