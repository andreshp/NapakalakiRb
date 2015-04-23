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

    # Getters name of the player, if he is dead and his level.
    attr_reader :dead, :name, :level

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
    def increaseLevel(levels)
      @level += levels
    end
    
    # Decrease the level of the player
    # @param levels [int] Levels to decrease.
    def decreaseLevel(levels)
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
      @visibleTreasures.each {|t| cardDealer.instance.giveTreasureBack(t)}
      @visibleTreasures.clear
      @hiddenTreasures.each {|t| cardDealer.instance.giveTreasureBack(t)}
      @hiddenTreasures.clear
    end
    
    # Discard the necklace if it is a visible treasure.
    def discardNecklaceIfVisible
      @visibleTreasures.each do |vt|
        if vt.getType == TreasureKind::NECKLACE
          CardDealer.instance.giveTreasureBack(vt)
          @visibleTreasures.delete(vt)
          break
        end
      end
    end
    
    # The player dies if he don't have treasures.
    def dieIfNoTreasures
      if visibleTreasures.empty? and hiddenTreasures.empty?
        self.die
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
      treasure.inject(0){|sum,x| sum += x.goldCoins} / 1000
    end
    
    #-------------- PUBLIC METHODS --------------#

    public
    
    # Apply the prize won fighting with a monster.
    # @param [Prize] Prize to apply.
    def applyPrize(prize)
      # Increments the levels
      incrementLevels(prize.levels)
      # Adds the treasures
      numberTreasures = [prize.treasures, 4-@hiddenTreasures.size].min
      numberTreasures.times {@hiddenTreasures << CardDealer.instance.nextTreasure}
    end

    # Combat against a given monster.
    # @param monster [Monster] Monster to fight against.
    def combat(monster)
      # If player's level is greater than monster's level
      # the player wins.
      # Otherwise a dice is rolled. If the dice return 5 or 6
      # the player can scape. Else the player loses the combat.
      if @level > monster.CombatLevel
        applyPrize(monster.prize)
        combatResult = @level < 10? WIN : WINANDWINGAME
      else
        randomNumber = Dice.nextNumber
        if randomNumber >= 5
          return CombatResult.LOSEANDESCAPE
        elsif monster.badCons.kills
          die
          combatResult = LOSTANDDIE
        else
          applyBadConsequence(monster.badCons)
          combatResult = LOSE
        end
      end
      combatResult
    end

    # Apply the bad consequence given.
    # @param badCons [BadConsequence] Bad Consequence to apply.
    def applyBadConsequence(badCons)
      # Decrement the correesponding levels
      decrementLevels(bad.getLevels)
      # Set the pending bad consequence
      pendingBadCons = badCons.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
      setPendingBadConsequence(pendingBadCons)
    end

    # Make a given treasure visible.
    # @param [Treasure] Treasure to make visible.
    # @return Bolean    
    def makeTreasureVisible(treasure)
    end

    # Check if the given treasure can be made visible.
    # A treasure can be made visible if in that case the player's visible 
    # treasures verifies the game condition:
    #   "There are no more than one treasure of each kind but ONEHAND, which 2 are 
    #    allowed. There must not be BOTHHANDS and ONEHAND treasures at the same time."
    # @param [Treasure] Treasure to check.
    # @return Boolean with the checking result.
    def canMakeTreasureVisible(treasure)
      tr_types = @visibleTreasures.map(&:getType)

      if @hiddenTreasures.member?(t) 
        if tr_types.include?(t.getType)
          if t.getType == TreasureKind::ONEHAND and tr_types.count(TreasureKind::ONEHAND) < 2
            return true
          else return false
        elsif t.getType == TreasureKind::BOTHHANDS and tr_types.include?(TreasureKind::ONEHAND)
          return false
        else return true
      end
    end
        
    # Discard the tresure given if it is visible.
    def discardVisibleTreasure(treasure)
    end

    # Discard the given treasure if it is hidden.
    def discardHiddenTreasure(treasure)
    end

    # Buy levels
    # @param visible [Treasure []] Visible treasures to sell. 
    # @param hidden [Treasure []] Hidden treasures to sell. 
    # @return Bolean    
    def buyLevels(visible, hidden)
    end

    # Get the combat level of the player.
    # @return Integer with the combat level
    def getCombatLevel
      if @visibleTreasures.include? NECKLACE
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
      randomNumber = Dice.nextNumber
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

#        def setVisibleTreasureList(treasures)
#            @visibleTreasures = treasures
#        end
#        def setHiddenTreasureList(treasures)
#            @hiddenTreasures = treasures
#        end

    end
end