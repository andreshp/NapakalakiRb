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
      place = tr_list.index(t.kind)
      tr_list.delete_at(place) if place != nil
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
      # If the badCons does not have specific treasures
      # takes nVisibleTreasures and nHiddenTreasures tresures.
      if @specificVisibleTreasures == nil and @specificHiddenTreasures == nil
        nVisible = [@nVisibleTreasures, v.size].min
        nHidden = [@nHiddenTreasures, h.size].min
        badCons = BadConsequence.newNumberOfTreasures("Falta por cumplir:",0,nVisible,nHidden)
      # If the badCons has specific treasures
      # takes the specific ones.
      else
        pendingV = []; pendingH = []
        # Sort every array
        v = v.map(&:kind)
        h = h.map(&:kind)
        v.sort!
        h.sort!
        @specificVisibleTreasures.sort!
        @specificHiddenTreasures.sort!

        # Check which treasures put in the pending bad consequence
        i = 0
        for t in @specificVisibleTreasures
          while i < v.size and v[i] < t
            i += 1
          end          
          if v[i] == t
            pendingV << t
            i += 1
          end
          if i >= v.size
            break
          end
        end

        i = 0
        for t in @specificHiddenTreasures
          while i < h.size and h[i] < t
            i += 1
          end
          
          if h[i] == t
            pendingH << t
            i += 1
          end
          if i >= h.size
            break
          end
        end
        badCons = BadConsequence.newSpecificTreasures("Falta por cumplir:",0,pendingV,pendingH)
      end
      badCons
    end

    # Check if the Bad Consequence is empty.
    # @return Checking result.
    def isEmpty
      @death == false and @nVisibleTreasures == 0 and @nHiddenTreasures == 0 and 
        (@specificVisibleTreasures == nil or @specificVisibleTreasures.empty?) and 
        (@specificHiddenTreasures == nil  or @specificHiddenTreasures.empty?)
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
        @nVisibleTreasures = [0, @nVisibleTreasures-1].max
      end
    end

    # Method that updates the bad consequence substracting a hidden treasure.
    # @param t [Treasure] Treasure to substract.
    def substractHiddenTreasure(t)
      if @specificHiddenTreasures != nil
        substractTreasure(@specificHiddenTreasures,t)
      else
        @nHiddenTreasures = [0, @nHiddenTreasures-1].max
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


# ANTIGUA INICIALIZACIÓN DE MONSTRUOS:

#      # Monster: 3 Byakhees de de bonanza
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Pierdes tu armadura visible y tu armadura oculta.", 0,
#        [TreasureKind::ARMOR],[TreasureKind::ARMOR])
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
#
#      # Monster: Chibithulhu
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Embobados con el lindo primigenio te descartas de tu casco visible.",0,
#        [TreasureKind::HELMET], [])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Chibithulhu",2, badConsequence, prize)
#
#      #  Monster: El sopor de Dunwich
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
#        [TreasureKind::SHOE], [])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
#
#      # Monster: Ángeles de la noche ibicenca
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Te atrapan para llevarte de fiesta y te dejan caer. Descarta 1 mano visible y 1 mano oculta.",0,
#        [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
#      prize = Prize.new(4,1)
#      @unusedMonsters << Monster.new("Ángeles de la noche ibicenca",14,badConsequence,prize)
#
#      # Monster: El gorrón en el umbral.
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Pierdes todos tus tesoros visibles.", 0, 100, 0)
#      prize = Prize.new(3,1)
#      @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
#
#      # Monster: H. P.  Munchcraft.
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Pierdes la armadura visible.", 0,
#        [TreasureKind::ARMOR], [])
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("H. P. Munchcraft", 6, badConsequence, prize)
#
#      # Monster: Bichgooth
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Sientes bichos bajo la ropa. Descarta la armadura visible.",0,
#        [TreasureKind::ARMOR], [])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Bichgooth",2, badConsequence, prize)
#
#      # Monster: El rey de la rosa
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Pierdes 5 niveles y 3 tesoros visibles.",5,3,0)
#      prize = Prize.new(4,2)
#      @unusedMonsters << Monster.new("El rey de la rosa", 13, badConsequence, prize)
#
#      # Monster: La que redacta en las tinieblas
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, badConsequence, prize)
#
#      # Monster: Los hondos
#      badConsequence = BadConsequence.newDeath(
#        "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize)
#
#      # Monster: Semillas Cthulhu
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Pierdes 2 niveles y 2 tesoros ocultos.",2,0,2)
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
#
#      # Monster: Dameargo
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Te intentas escaquear. Pierdes una mano visible.",0,
#        [TreasureKind::ONEHAND], [])
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)
#
#      # Monster: Pollipólipo volante
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
#
#      # Monster: Yskhtihyssg-Goth
#      badConsequence = BadConsequence.newDeath(
#        "No le hace gracia que pronuncien mal su nombre. Estás muerto.")
#      prize = Prize.new(3,1)
#      @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, badConsequence, prize)
#
#      # Monster: Familia feliz
#      badConsequence = BadConsequence.newDeath(
#        "La familia te atrapa. Estás muerto.")
#      prize = Prize.new(4,1)
#      @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)
#
#      # Monster: Roboggoth
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.",2,
#        [TreasureKind::BOTHHANDS],[])
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)
#
#      # Monster: El espía
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Te asusta en la noche. Pierdes un casco visible.",0,
#        [TreasureKind::HELMET],[])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("El espía",5,badConsequence,prize)
#
#      # Monster: El lenguas
#      badConsequence = BadConsequence.newNumberOfTreasures(
#        "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",
#        2, 5, 0)
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)
#
#      # Monster: Bicéfalo
#      badConsequence = BadConsequence.newSpecificTreasures(
#        "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
#        [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Bicéfalo", 20, badConsequence, prize)
#
#      # Monster (with cultists): El mal indecible impronunciable
#      badConsequence = BadConsequence.newSpecificTreasures("Pierdes 1 mano visible.",0,
#        [TreasureKind::ONEHAND],[])
#      prize = Prize.new(3,1)
#      @unusedMonsters << Monster.new("El mal indecible impronunciable",10,badConsequence,prize,-2)
#
#      # Monster (with cultists): Testigos oculares
#      badConsequence = BadConsequence.newNumberOfTreasures("Pierdes tus tesoros visibles. Jajaja.",0,100,0)
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Testigos oculares",6,badConsequence,prize,6)
#
#      # Monster (with cultists): El gran Cthulhu
#      badConsequence = BadConsequence.newDeath("Hoy no es tu día de suerte. Mueres.")
#      prize = Prize.new(2,5)
#      @unusedMonsters << Monster.new("El gran Cthulhu",20,badConsequence,prize,4)
#
#      # Monster (with cultists): Serpiente Político
#      badConsequence = BadConsequence.newNumberOfTreasures("Tu gobierno te recorta 2 niveles.",2,0,0)
#      prize = Prize.new(2,1)
#      @unusedMonsters << Monster.new("Serpiente Político",8,badConsequence,prize,-2)
#
#      # Monster (with cultists): Felpuggoth
#      badConsequence = BadConsequence.newSpecificTreasures("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas.",0,
#        [TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::BOTHHANDS])
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Felpuggoth",2,badConsequence,prize,5)
#
#      # Monster (with cultists): Shoggoth
#      badConsequence = BadConsequence.newNumberOfTreasures("Pierdes 2 niveles.",2,0,0)
#      prize = Prize.new(4,2)
#      @unusedMonsters << Monster.new("Shoggoth",16,badConsequence,prize,-4)
#
#      # Monster (with cultists): Lolitagooth
#      badConsequence = BadConsequence.newNumberOfTreasures("Pintalabios negro. Pierdes 2 niveles.",2,0,0)
#      prize = Prize.new(1,1)
#      @unusedMonsters << Monster.new("Lolitagooth",2,badConsequence,prize,3)
