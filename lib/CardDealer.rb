#encoding: utf-8

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require "singleton"

require_relative '../lib/TreasureKind.rb'
require_relative '../lib/Treasure.rb'
require_relative '../lib/Monster.rb'

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
        end
    
        private
        # Private method which initializes the treasures' deck of cards.
        def initTreasureCardDeck

            #--------------------- Se añaden los monstruos  ----------------------#
    
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
    
            #--------------------- CREACIÓN DE LOS MONSTRUOS ---------------------#
        
            # Monster: 3 Byakhees de de bonanza
            badConsequence = BadConsequence.newSpecificTreasures(
                "Pierdes tu armadura visible y tu armadura oculta.", 0,
                [TreasureKind::ARMOR],[TreasureKind::ARMOR])
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)
    
            # Monster: Chibithulhu
            badConsequence = BadConsequence.newSpecificTreasures(
                "Embobados con el lindo primigenio te descartas de tu casco visible.",0,
                [TreasureKind::HELMET], [])
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("Chibithulhu",2, badConsequence, prize)
    
            #  Monster: El sopor de Dunwich
            badConsequence = BadConsequence.newSpecificTreasures(
                "El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
                [TreasureKind::SHOE], [])
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)
    
            # Monster: Ángeles de la noche ibicenca
            badConsequence = BadConsequence.newSpecificTreasures(
                "Te atrapan para llevarte de fiesta y te dejan caer. Descarta 1 mano visible y 1 mano oculta.",0,
                [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
            prize = Prize.new(4,1)
            @unusedMonsters << Monster.new("Ángeles de la noche ibicenca",14,badConsequence,prize)
    
            # Monster: El gorrón en el umbral.
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Pierdes todos tus tesoros visibles.", 0, 100, 0)
            prize = Prize.new(3,1)
            @unusedMonsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)
    
            # Monster: H. P.  Munchcraft.
            badConsequence = BadConsequence.newSpecificTreasures(
                "Pierdes la armadura visible.", 0,
                [TreasureKind::ARMOR], [])
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("H. P. Munchcraft", 6, badConsequence, prize)
    
            # Monster: Bichgooth
            badConsequence = BadConsequence.newSpecificTreasures(
                "Sientes bichos bajo la ropa. Descarta la armadura visible.",0,
                [TreasureKind::ARMOR], [])
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("Bichgooth",2, badConsequence, prize)
    
            # Monster: El rey de la rosa
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Pierdes 5 niveles y 3 tesoros visibles.",5,3,0)
            prize = Prize.new(4,2)
            @unusedMonsters << Monster.new("El rey de la rosa", 13, badConsequence, prize)
    
            # Monster: La que redacta en las tinieblas
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("La que redacta en las tinieblas", 2, badConsequence, prize)
    
            # Monster: Los hondos
            badConsequence = BadConsequence.newDeath(
                "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("Los hondos", 8, badConsequence, prize)
    
            # Monster: Semillas Cthulhu
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Pierdes 2 niveles y 2 tesoros ocultos.",2,0,2)
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)
    
            # Monster: Dameargo
            badConsequence = BadConsequence.newSpecificTreasures(
                "Te intentas escaquear. Pierdes una mano visible.",0,
                [TreasureKind::ONEHAND], [])
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("Dameargo", 1, badConsequence, prize)
    
            # Monster: Pollipólipo volante
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)
    
            # Monster: Yskhtihyssg-Goth
            badConsequence = BadConsequence.newDeath(
                "No le hace gracia que pronuncien mal su nombre. Estás muerto.")
            prize = Prize.new(3,1)
            @unusedMonsters << Monster.new("Yskhtihyssg-Goth", 12, badConsequence, prize)
    
            # Monster: Familia feliz
            badConsequence = BadConsequence.newDeath(
                "La familia te atrapa. Estás muerto.")
            prize = Prize.new(4,1)
            @unusedMonsters << Monster.new("Familia feliz", 1, badConsequence, prize)
    
            # Monster: Roboggoth
            badConsequence = BadConsequence.newSpecificTreasures(
                "La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.",2,
                [TreasureKind::BOTHHANDS],[])
            prize = Prize.new(2,1)
            @unusedMonsters << Monster.new("Roboggoth", 8, badConsequence, prize)
    
            # Monster: El espía
            badConsequence = BadConsequence.newSpecificTreasures(
                "Te asusta en la noche. Pierdes un casco visible.",0,
                [TreasureKind::HELMET],[])
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("El espía",5,badConsequence,prize)
    
            # Monster: El lenguas
            badConsequence = BadConsequence.newNumberOfTreasures(
                "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",
                2, 5, 0)
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("El lenguas", 20, badConsequence, prize)
    
            # Monster: Bicéfalo
            badConsequence = BadConsequence.newSpecificTreasures(
                "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
                [TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
            prize = Prize.new(1,1)
            @unusedMonsters << Monster.new("Bicéfalo", 20, badConsequence, prize)
        end
    
        # Private method which shuffles treasures' deck of cards
        def shuffleTreasures
            @unusedTreasures.shuffle!
        end
    
        # Private mehod which shuffles monsters' deck of cards
        def shuffleMonsters
            @unusedMonsters.shuffle!
        end
        
        #-------------------- PUBLIC METHODS --------------------#
        public

        # Takes a treasure from the top of the deck
        # @return Treasure taken.
        def nextTreasure
            @unusedTreasures.pop
            if @unusedTreasures.empty?
                @unusedTreasures = @usedTreasures
                @usedTreasures = []
                @unusedTreasures.shuffle!
            end
        end
    
        # Takes a monster from the top of the deck
        # @return Monster taken.
        def nextMonster
            @unusedMonsters.pop
            if @unusedMonsters.empty?
                @unusedMonsters = @usedMonsters
                @usedMonsters = []
                @unusedMonsters.shuffle!
            end
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
            shuffleTreasures
            shuffleMonsters
        end 
    end
end