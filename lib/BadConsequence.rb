#encoding: utf­8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative 'TreasureKind.rb'

# Bad Consequence Class.
# It indicates the consequences of losing to the monster.
# These consequences are lost of levels, treasures and even death.
# 
# @author andreshp, jlsuarez
class BadConsequence

    # Private constructor whichs initializes all attributes.
    #
    # @param text [string] Text that explains what does the bas consequence do. It sets text attribute.
    # @param levels [int] Levels that are lost with the bad consequence. It sets levels attribute.
    # @param death [boolean] Value that indicates if the nad consequence is death. It sets death attribute.
    # @param nVisible [int] Number of Visible Treasures that are lost. It sets nVisibleTreasures attribute.
    # @param nHidden [int] Number of Hidden Treasures that are lost. It sets nHiddenTreasures attribute.
    # @param tVisible [int] Array with the visible treasures. It sets specificVisibleTreasures attribute.
    # @param tHidden [int] Array with the hidden treasures. It sets specificHiddenTreasures attribute.

    def initialize(text,levels,death,nVisible,nHidden,tVisible,tHidden)
        @text = text
        @death = death
        @levels = levels

        @nVisibleTreasures = nVisible
        @nHiddenTreasures = nHidden

        @specificVisibleTreasures = tVisible
        @specificHiddenTreasures = tHidden
    end

    ##########
    ########## new_* methods need to review default values
    ##########

    # -------------------- Public constructors -------------------- #

    # Constructor that initializes every attribute but the arrays and death.

    def self.new_by_number(text, levels, nVisible, nHidden)
        new(text,levels,false,nVisible,nHidden,nil,nil)
    end 

    # Constructor that initializes the attributes text and death.

    def self.new_by_death(text,death)
        new(text,0,death,0,0,nil,nil)
        
    end

    # Constructor that initializes the attributes text, levels and both treasures array.

    def self.new_by_specific(text, levels, tVisible, tHidden)
        new(text,levels, false, 0, 0, tVisible, tHidden)
    end
    
    # Get Methods available for attributes text, levels, nVisibleTreasures, nHiddenTreasures and death.
    attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death


    #Disables public constructor new in order to guarantee a right initialization of a BadConsequence instance. 
    private_class_method :new

    # Returns a string with the Bad Consequence instance contents.
    # @param spaces [int] Spaces in each line from second to end.
    # @return String with the contents.
    def toString(spaces = 0)
        str_spaces = "\s"*spaces
        str_spaces + "Text = " + text.to_s + "\n" + str_spaces + "Levels = " + levels.to_s + "\n" + str_spaces + "nVisibleTreasures = " + 
        nVisibleTreasures.to_s + "\n" + str_spaces + "nHiddenTreasures = " + nHiddenTreasures.to_s + "\n" + str_spaces + "Death = " + death.to_s
    end
end


