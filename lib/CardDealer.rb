#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require "singleton"

require_relative '../lib/Treasure.rb'
require_relative '../lib/Monster.rb'
require_relative '../lib/Cultist.rb'

# Module Model.
# Napakalaki game's model.
module Model
  # CardDealer Class.
  # This class manages everything related to decks of cards in Napakalaki game.
  # It is a singleton class, no more than one instance is allowed.
  #
  # @author andreshp, jlsuarez
  class CardDealer

    include Singleton

    # Initialize method.
    # 
    # Initializes every attribute to a list.
    #  - unusedTreasures : Deck with the unused treasures
    #  - usedTreasures : Deck with the used treasures
    #  - unusedMonsters : Deck with the unused monsters
    #  - usedMonsters : Deck with the used monsters
    def initialize
      @unusedTreasures = []
      @unusedMonsters  = []
      @usedTreasures   = []
      @usedMonsters    = []
      @unusedCultist   = []
    end

    private
    # Private method which initializes the treasures' deck of cards.
    def initTreasureCardDeck

      #-------------------#
      # Add the treasures #
      #-------------------#

      # Treasure: ¡Sí mi amo!
      @unusedTreasures << Treasure.new("¡Sí mi amo!",0,4,7,TreasureKind::HELMET)

      # Treasure: Botas de investigación
      @unusedTreasures << Treasure.new("Botas de investigación",600,3,4,TreasureKind::SHOE)

      # Treasure: Capucha de Cthulhu
      @unusedTreasures << Treasure.new("Capucha de Cthulhu",500,3,5,TreasureKind::HELMET)

      # Treasure: A prueba de babas
      @unusedTreasures << Treasure.new("A prueba de babas",400,2,5,TreasureKind::ARMOR)

      # Treasure: Botas de lluvia ácida
      @unusedTreasures << Treasure.new("Botas de lluvia ácida",800,1,1,TreasureKind::BOTHHANDS)

      # Treasure: Casco minero
      @unusedTreasures << Treasure.new("Casco minero",400,2,4,TreasureKind::HELMET)

      # Treasure: Ametralladora Thompson
      @unusedTreasures << Treasure.new("Ametralladora Thompson",600,4,8,TreasureKind::BOTHHANDS)

      # Treasure: Camiseta de la UGR
      @unusedTreasures << Treasure.new("Camiseta de la UGR",100,1,7,TreasureKind::ARMOR)

      # Treasure: Clavo de rail ferroviario
      @unusedTreasures << Treasure.new("Clavo de rail ferroviario",400,3,6,TreasureKind::ONEHAND)

      # Treasure: Cuchillo de Sushi arcano
      @unusedTreasures << Treasure.new("Cuchillo de Sushi arcano",300,2,3,TreasureKind::ONEHAND)

      # Treasure: Fez alópodo
      @unusedTreasures << Treasure.new("Fez alópodo",700,3,5,TreasureKind::HELMET)

      # Treasure: Hacha prehistórica
      @unusedTreasures << Treasure.new("Hacha prehistórica",500,2,5,TreasureKind::ONEHAND)

      # Treasure: El aparato del Pr. Tesla
      @unusedTreasures << Treasure.new("El aparato del Pr. Tesla",900,4,8,TreasureKind::ARMOR)

      # Treasure: Gaita
      @unusedTreasures << Treasure.new("Gaita",500,4,5,TreasureKind::BOTHHANDS)

      # Treasure: Insecticida
      @unusedTreasures << Treasure.new("Insecticida",300,2,3,TreasureKind::ONEHAND)

      # Treasure: Escopeta de 3 cañones
      @unusedTreasures << Treasure.new("Escopeta de 3 cañones",700,4,6,TreasureKind::BOTHHANDS)

      # Treasure: Garabato místico
      @unusedTreasures << Treasure.new("Garabato místico",300,2,2,TreasureKind::ONEHAND)

      # Treasure: La fuerza de Mr. T
      @unusedTreasures << Treasure.new("La fuerza de Mr. T",1000,0,0,TreasureKind::NECKLACE)

      # Treasure: La rebeca metálica
      @unusedTreasures << Treasure.new("La rebeca metálica",400,2,3,TreasureKind::ARMOR)

      # Treasure: Mazo de los antiguos
      @unusedTreasures << Treasure.new("Mazo de los antiguos",200,3,4,TreasureKind::ONEHAND)

      # Treasure: Necroplayboycón
      @unusedTreasures << Treasure.new("Necroplayboycón",300,3,5,TreasureKind::ONEHAND)

      # Treasure: Lanzallamas
      @unusedTreasures << Treasure.new("Lanzallamas",800,4,8,TreasureKind::BOTHHANDS)

      # Treasure: Necrocomicón
      @unusedTreasures << Treasure.new("Necrocomicón",100,1,1,TreasureKind::ONEHAND)

      # Treasure: Necronomicón
      @unusedTreasures << Treasure.new("Necronomicón",800,5,7,TreasureKind::BOTHHANDS)

      # Treasure: Linterna a 2 manos
      @unusedTreasures << Treasure.new("Linterna a 2 manos",400,3,6,TreasureKind::BOTHHANDS)

      # Treasure: Necrognomicón
      @unusedTreasures << Treasure.new("Necrognomicón",200,2,4,TreasureKind::ONEHAND)

      # Treasure: Necrotelecom
      @unusedTreasures << Treasure.new("Necrotelecom",300,2,3,TreasureKind::HELMET)

      # Treasure: Porra preternatural
      @unusedTreasures << Treasure.new("Porra preternatural",200,2,3,TreasureKind::ONEHAND)

      # Treasure: Tentáculo de pega
      @unusedTreasures << Treasure.new("Tentáculo de pega",200,0,1,TreasureKind::HELMET)

      # Treasure: Zapato deja-amigos
      @unusedTreasures << Treasure.new("Zapato deja-amigos",500,0,1,TreasureKind::SHOE)

      # Treasure: Shogulador
      @unusedTreasures << Treasure.new("Shogulador",600,1,1,TreasureKind::BOTHHANDS)

      # Treasure: Varita de atizamiento
      @unusedTreasures << Treasure.new("Varita de atizamiento",400,3,4,TreasureKind::ONEHAND)
    end

    # Private method which initializes the monsters' deck of cards.
    def initMonsterCardDeck

      #-------------------#
      # Add the Monsters  #
      #-------------------#
    
      # Monster: 3 Byakhees de de bonanza
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Pierdes tu armadura visible y tu armadura oculta.", 0,
        [TreasureKind::ARMOR],[TreasureKind::ARMOR])
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)

      # Monster: Chibithulhu
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Embobados con el lindo primigenio te descartas de tu casco visible.",0,
        [TreasureKind::HELMET], [])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Chibithulhu",2, badConsequence, prize)

      #  Monster: El sopor de Dunwich
      badConsequence = BadConsequenceSpecificTreasures.new(
        "El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
        [TreasureKind::SHOE], [])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)

      # Monster: Ángeles de la noche ibicenca
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Te atrapan para llevarte de fiesta y te dejan caer. Descarta 1 mano visible y 1 mano oculta.",0,
        [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
      prize = Prize.new(4,1)
      @unusedMonsters << Monster.new("Ángeles de la noche ibicenca",14,badConsequence,prize)

      # Monster: El gorrón en el umbral.
      badConsequence = BadConsequenceNumberTreasures.new(
        "Pierdes todos tus tesoros visibles.", 0, 100, 0)
      prize = Prize.new(3,1)
      @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)

      # Monster: H. P.  Munchcraft.
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Pierdes la armadura visible.", 0,
        [TreasureKind::ARMOR], [])
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("H. P. Munchcraft", 6, badConsequence, prize)

      # Monster: Bichgooth
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Sientes bichos bajo la ropa. Descarta la armadura visible.",0,
        [TreasureKind::ARMOR], [])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Bichgooth",2, badConsequence, prize)

      # Monster: El rey de la rosa
      badConsequence = BadConsequenceNumberTreasures.new(
        "Pierdes 5 niveles y 3 tesoros visibles.",5,3,0)
      prize = Prize.new(4,2)
      @unusedMonsters << Monster.new("El rey de la rosa", 13, badConsequence, prize)

      # Monster: La que redacta en las tinieblas
      badConsequence = BadConsequenceNumberTreasures.new(
        "Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, badConsequence, prize)

      # Monster: Los hondos
      badConsequence = BadConsequenceDeath.new(
        "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize)

      # Monster: Semillas Cthulhu
      badConsequence = BadConsequenceNumberTreasures.new(
        "Pierdes 2 niveles y 2 tesoros ocultos.",2,0,2)
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)

      # Monster: Dameargo
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Te intentas escaquear. Pierdes una mano visible.",0,
        [TreasureKind::ONEHAND], [])
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)

      # Monster: Pollipólipo volante
      badConsequence = BadConsequenceNumberTreasures.new(
        "Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)

      # Monster: Yskhtihyssg-Goth
      badConsequence = BadConsequenceDeath.new(
        "No le hace gracia que pronuncien mal su nombre. Estás muerto.")
      prize = Prize.new(3,1)
      @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, badConsequence, prize)

      # Monster: Familia feliz
      badConsequence = BadConsequenceDeath.new(
        "La familia te atrapa. Estás muerto.")
      prize = Prize.new(4,1)
      @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)

      # Monster: Roboggoth
      badConsequence = BadConsequenceSpecificTreasures.new(
        "La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.",2,
        [TreasureKind::BOTHHANDS],[])
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)

      # Monster: El espía
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Te asusta en la noche. Pierdes un casco visible.",0,
        [TreasureKind::HELMET],[])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("El espía",5,badConsequence,prize)

      # Monster: El lenguas
      badConsequence = BadConsequenceNumberTreasures.new(
        "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",
        2, 5, 0)
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)

      # Monster: Bicéfalo
      badConsequence = BadConsequenceSpecificTreasures.new(
        "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
        [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Bicéfalo", 20, badConsequence, prize)

      # Monster (with cultists): El mal indecible impronunciable
      badConsequence = BadConsequenceSpecificTreasures.new("Pierdes 1 mano visible.",0,
        [TreasureKind::ONEHAND],[])
      prize = Prize.new(3,1)
      @unusedMonsters << Monster.new("El mal indecible impronunciable",10,badConsequence,prize,-2)

      # Monster (with cultists): Testigos oculares
      badConsequence = BadConsequenceNumberTreasures.new("Pierdes tus tesoros visibles. Jajaja.",0,100,0)
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Testigos oculares",6,badConsequence,prize,6)

      # Monster (with cultists): El gran Cthulhu
      badConsequence = BadConsequenceDeath.new("Hoy no es tu día de suerte. Mueres.")
      prize = Prize.new(2,5)
      @unusedMonsters << Monster.new("El gran Cthulhu",20,badConsequence,prize,4)

      # Monster (with cultists): Serpiente Político
      badConsequence = BadConsequenceNumberTreasures.new("Tu gobierno te recorta 2 niveles.",2,0,0)
      prize = Prize.new(2,1)
      @unusedMonsters << Monster.new("Serpiente Político",8,badConsequence,prize,-2)

      # Monster (with cultists): Felpuggoth
      badConsequence = BadConsequenceSpecificTreasures.new("Pierdes tu casco y tu armadura visible. Pierdes tus manos ocultas.",0,
        [TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::BOTHHANDS])
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Felpuggoth",2,badConsequence,prize,5)

      # Monster (with cultists): Shoggoth
      badConsequence = BadConsequenceNumberTreasures.new("Pierdes 2 niveles.",2,0,0)
      prize = Prize.new(4,2)
      @unusedMonsters << Monster.new("Shoggoth",16,badConsequence,prize,-4)

      # Monster (with cultists): Lolitagooth
      badConsequence = BadConsequenceNumberTreasures.new("Pintalabios negro. Pierdes 2 niveles.",2,0,0)
      prize = Prize.new(1,1)
      @unusedMonsters << Monster.new("Lolitagooth",2,badConsequence,prize,3)

    end

    # Private method which initializes the cultist's deck of cards.
    def initCultistCardDeck
      @unusedCultist << Cultist.new("Sectario",1)
      @unusedCultist << Cultist.new("Sectario",2)
      @unusedCultist << Cultist.new("Sectario",1)
      @unusedCultist << Cultist.new("Sectario",2)
      @unusedCultist << Cultist.new("Sectario",1)
      @unusedCultist << Cultist.new("Sectario",1)
    end

    # Private method which shuffles treasures' deck of cards
    def shuffleTreasures
      @unusedTreasures.shuffle!
    end

    # Private method which shuffles monsters' deck of cards
    def shuffleMonsters
      @unusedMonsters.shuffle!
    end

    # Private method which shuffles cultist's deck of cards
    def shuffleCultists
      @unusedCultist.shuffle!
    end

    #-------------------- PUBLIC METHODS --------------------#
    public

    # Takes a treasure from the top of the deck
    # @return Treasure taken.
    def nextTreasure
      if @unusedTreasures.empty?
        @unusedTreasures = @usedTreasures
        @usedTreasures = []
        @unusedTreasures.shuffle!
      end
      @unusedTreasures.pop
    end

    # Takes a monster from the top of the deck
    # @return Monster taken.
    def nextMonster
      if @unusedMonsters.empty?
        @unusedMonsters = @usedMonsters
        @usedMonsters = []
        @unusedMonsters.shuffle!
      end
      @unusedMonsters.pop
    end

    #Takes a cultist from the top of the deck
    # @return Cultist taken
    def nextCultist
      @unusedCultist.pop
    end

    # Returns a treasure to the used treasures' deck
    # @param t [Treasure] Treasure to add
    def giveTreasureBack(t)
      @usedTreasures << t
    end

    # Returns a monster to the used monsters' deck
    # @param m [Monster] Monster to add
    def giveMonsterBack(m)
      @usedMonsters << m
    end

    # Initializes the cards in order to get them ready to the game.
    def initCards
      initMonsterCardDeck
      initTreasureCardDeck
      initCultistCardDeck
      shuffleTreasures
      shuffleMonsters
      shuffleCultists
    end 
  end
end