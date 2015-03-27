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
    class Treasure
    
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
    
        # The player dies
        def die
        end
    
        # Discard the necklace if it is a visible treasure.
        def discardNecklaceIfVisible
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
    
        # Method that compute the total sum of gold coins of the given treasures.
        # @param treasures [Array Treasures] Array with the treasures.
        # @return Total sum of gold coins
        def computeGoldCoins(treasures)
        end
    
        #-------------- PUBLIC METHODS --------------#
    
        public
    
        # Apply the prize won fighting with a monster.
        # @param [Prize] Prize to apply.
        def applyPrize(prize)
        end
    
        # Combat against a given monster.
        # @param monster [Monster] Monster to fight against.
        def combatMonster(monster)
        end
    
        # Apply the bad consequence given.
        # @param badCons [BadConsequence] Bad Consequence to apply.
        def applyBadConsequence(badCons)
        end
    
        # Make a given treasure visible.
        # @param [Treasure] Treasure to make visible.
        # @return Bolean    
        def makeTreasureVisible(treasure)
        end
        
        # Check if the given treasure can be made visible.
        # @param [Treasure] Treasure to check.
        # @return Bolean
        def canMakeTreasureVisible(treasure)
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
        # hidden treasures is no more than 4.
        # @return Bolean with the result of the check.
        def validState
            pendingBadConsequence == nil and hiddenTreasures.size <= 4
        end
        
        # @return Bolean    
        def initTreasures
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
    end
end