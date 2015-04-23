#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative 'TreasureKind.rb'

# Module Model.
# Napakalaki game's model.
module Model
  # Bad Consequence Class.
  # It indicates the consequences of losing to the monster.
  # These consequences are lost of levels, treasures and even death.
  # 
  # @author andreshp, jlsuarez
  class BadConsequence

    # -------------------- PRIVATE METHODS -------------------- #

    # Disables public constructor new in order to allow
    # more than one possible constructors.
    private_class_method :new

    private

    # Private method which substract treasures from the given 
    # (visible/hidden) treasure list.
    # @param tr_list 
    def substractTreasure(tr_list, t)
      i = tr_list.index(t.kind)
      tr_list.delete_at(i) if i != nil
    end

    # -------------------- PUBLIC METHODS -------------------- #

    public
  
    # Initializes all the attributes.
    #
    # @param text     [string] Text that explains what does the bas consequence do. It sets text attribute.
    # @param levels   [int] Levels that are lost with the bad consequence. It sets levels attribute.
    # @param death    [boolean] Value that indicates if the nad consequence is death. It sets death attribute.
    # @param nVisible [int] Number of Visible Treasures that are lost. It sets nVisibleTreasures attribute.
    # @param nHidden  [int] Number of Hidden Treasures that are lost. It sets nHiddenTreasures attribute.
    # @param tVisible [int] Array with the visible treasures. It sets specificVisibleTreasures attribute.
    # @param tHidden  [int] Array with the hidden treasures. It sets specificHiddenTreasures attribute.
    def initialize(text,levels,nVisible,nHidden,tVisible,tHidden,death)
      @text = text
      @death = death
      @levels = levels

      @nVisibleTreasures = nVisible
      @nHiddenTreasures = nHidden

      @specificVisibleTreasures = tVisible
      @specificHiddenTreasures = tHidden
    end

    # Constructor that initializes every attribute but the arrays and death.
    def self.newNumberOfTreasures(text, levels, nVisible, nHidden)
      new(text,levels,nVisible,nHidden,nil,nil,false)
    end 

    # Constructor that initializes the attributes text and death.
    def self.newDeath(text)
      new(text,0,0,0,nil,nil,true)
    end

    # Constructor that initializes the attributes text, levels and both treasures array.
    def self.newSpecificTreasures(text, levels, tVisible, tHidden)
      new(text,levels, 0, 0, tVisible, tHidden, false)
    end

    # Get Methods available for attributes text, levels, nVisibleTreasures, 
    # nHiddenTreasures, specificVisibleTreasures and specificHiddenTreasures
    attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures
    attr_reader :specificVisibleTreasures, :specificHiddenTreasures

    # @param v [Treasure []]
    # @return BadConsequence: pendingBad
    def adjustToFitTreasureLists(v, h)
      pendingV = []; pendingH = []
      # If the badCons does not have specific treasures
      # takes nVisibleTreasures and nHiddenTreasures tresures.
      if @nVisibleTreasures > 0 or @nHiddenTreasures > 0
        pendingVSize = [@nVisibleTreasures, v.size].min() -1
        pendingHSize = [@nHiddenTreasures, h.size].min() -1
        pendingV = v[0 .. pendingVSize] if pendingVSize >= 0
        pendingH = h[0 .. pendingHSize] if pendingHSize >= 0

      # If the badCons has specific treasures
      # takes the specific ones.
      else
        # Sort every array
        v.sort! { |a,b| a.kind <=> b.kind }
        h.sort! { |a,b| a.kind <=> b.kind }
        @specificVisibleTreasures.sort!; @specificHiddenTreasures.sort!
        # Check which treasures put in the pending bad consequence
        i = 0
        for t in @specificVisibleTreasures
          i += 1 while v[i].kind < t
          pendingV << t if v[i].kind == t; i += 1
        end
        i = 0
        for t in @specificHiddenTreasures
          i += 1 while v[i].kind < t
          pendingH << t if v[i].kind == t; i += 1
        end
      end
    end

    # Check if the Bad Consequence is empty.
    # @return Checking result.
    def isEmpty
      death == false and nVisibleTreasures == 0 and nHiddenTreasures == 0 and 
        specificVisibleTreasures == nil and specificHiddenTreasures == nil
    end

    # Check if the player dies as the bad consequence.
    # @return Checking result.
    def kills
      @death
    end

    # Method that updates the bad consequence substracting a visible treasure.
    # @param t [Treasure] Treasure to substract.
    def substractVisibleTreasure(t)
      if @specificVisibleTreasures != nil
        substractTreasure(@specificVisibleTreasures,t)
      else
        @nVisibleTreasures -= 1
      end
    end

    # Method that updates the bad consequence substracting a hidden treasure.
    # @param t [Treasure] Treasure to substract.
    def substractHidddenTreasure(t)
      if @specificHiddenTreasures != nil
        substractTreasure(@specificHiddenTreasures,t)
      else
        @nVisibleTreasures -= 1
      end
    end
    
    # Returns a string with the Bad Consequence instance contents.
    # @param spaces [int] Spaces in each line of the string.
    # @return String with the contents.
    def to_s(spaces = 0)
      # Variables
      specificVisibleStr = ""; specificHiddenStr = ""; str_spaces = "\s"*spaces

      # Get the specific visible treasures
      if @specificVisibleTreasures == nil || @specificVisibleTreasures.empty?
        specificVisibleStr += "Ninguno"
      else
        @specificVisibleTreasures.each do |i|
          specificVisibleStr += "#{i} "
        end
      end

      # Get the specific hidden treasures
      if @specificHiddenTreasures == nil || @specificHiddenTreasures.empty?
        specificHiddenStr = "Ninguno"
      else
        @specificHiddenTreasures.each do |i|
          specificHiddenStr += "#{i} "
        end
      end

      # Return the string
      str_spaces + "Text = " + @text.to_s + "\n" + 
      str_spaces + "Levels = " + @levels.to_s + "\n" + 
      str_spaces + "nVisibleTreasures = " + @nVisibleTreasures.to_s + "\n" + 
      str_spaces + "nHiddenTreasures = " + @nHiddenTreasures.to_s + "\n" + 
      str_spaces + "specificVisibleTreasures = " + specificVisibleStr.upcase + "\n" + 
      str_spaces + "specificHiddenTreasures = " + specificHiddenStr.upcase + "\n" + 
      str_spaces + "Death = " + @death.to_s
    end
  end
end