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
    
        # -------------------- Public constructors -------------------- #
    
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
        
        # Get Methods available for attributes text, levels, nVisibleTreasures, nHiddenTreasures, 
        # death, specificVisibleTreasures and specificHiiddenTreasures
        attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death
        attr_reader :specificVisibleTreasures, :specificHiddenTreasures
    
        # Disables public constructor new in order to guarantee a right initialization of a BadConsequence instance. 
        private_class_method :new
    
        # Check if the Bad Consequence is empty.
        def isEmpty
            death == false and nVisibleTreasures == 0 and nHiddenTreasures == 0 and 
                specificVisibleTreasures == nil and specificHiddenTreasures == nil
        end
    
        # Check if the player dies as the bad consequence.
        def kills
            @death
        end
    
        # Returns a string with the Bad Consequence instance contents.
        # @param spaces [int] Spaces in each line of the string.
        # @return String with the contents.
        def to_s(spaces = 0)
            specificVisibleStr = ""; specificHiddenStr = ""; str_spaces = "\s"*spaces
    
            # Get the specific visible treasures
            if specificVisibleTreasures == nil || specificVisibleTreasures.empty?
                specificVisibleStr += "Ninguno"
            else
                specificVisibleTreasures.each do |i|
                    specificVisibleStr += "#{i} "
                end
            end
    
            # Get the specific hidden treasures
            if specificHiddenTreasures == nil || specificHiddenTreasures.empty?
                specificHiddenStr = "Ninguno"
            else
                specificHiddenTreasures.each do |i|
                    specificHiddenStr += "#{i} "
                end
            end
    
            str_spaces + "Text = " + text.to_s + "\n" + str_spaces + "Levels = " + levels.to_s + "\n" + str_spaces + "nVisibleTreasures = " + 
            nVisibleTreasures.to_s + "\n" + str_spaces + "nHiddenTreasures = " + nHiddenTreasures.to_s + "\n" + str_spaces +
            "specificVisibleTreasures = " + specificVisibleStr.upcase + "\n" + str_spaces + "specificHiddenTreasures = " + specificHiddenStr.upcase +
             "\n" + str_spaces + "Death = " + death.to_s
        end
    end
end