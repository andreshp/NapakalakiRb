#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

#require_relative '../lib/Player.rb'
require_relative '../lib/CultistPlayer.rb'
require_relative '../lib/Cultist.rb'
require_relative '../lib/BadConsequence.rb'
require_relative '../lib/Monster.rb'
require_relative '../lib/CardDealer.rb'
require_relative '../lib/CombatResult.rb'
require_relative '../lib/TreasureKind.rb'
require_relative '../lib/Dice.rb'
require_relative '../lib/Napakalaki.rb'

module Model
<<<<<<< HEAD
  class Examen4
    @@countRunExecutions = 0
=======
    class Examen
        def initialize

        end

        def self.run2 ## CLASS METHOD run

        end

        def run ## INSTANCE METHOD run
            p = Player.new("Jugador examen.")

            cult1 = Cultist.new("SECTARIO 1",2)
            p1 = Player.new("Jugador sectario")
            psec1 = CultistPlayer.new(p1,cult1)

            cult2 = Cultist.new("SECTARIO 2",1)
            p2 = Player.new("Jugador sectario 2")
            psec2 = CultistPlayer.new(p2,cult2)

    ##############################################
            t1 = Model::Treasure.new("Botas de investigación",600,3,4,Model::TreasureKind::SHOE)
            t2 = Model::Treasure.new("Ametralladora Thompson",600,4,8,Model::TreasureKind::BOTHHANDS)
            t3 = Model::Treasure.new("Clavo de rail ferroviario",400,3,6,Model::TreasureKind::ONEHAND)
            t4 = Model::Treasure.new("Cuchillo de Sushi arcano",300,2,3,Model::TreasureKind::ONEHAND)
            t5 = Model::Treasure.new("Otros tesoros1",400,2,3,Model::TreasureKind::HELMET)
            t6 = Model::Treasure.new("Otros tesoros2",600,5,6,Model::TreasureKind::ARMOR)
            t7 = Model::Treasure.new("Otros tesoros3",700,4,8,Model::TreasureKind::ONEHAND)
            t8 = Model::Treasure.new("Otros tesoros4",800,4,8,Model::TreasureKind::ONEHAND)
            hidden=Array.new
            hidden << t1
            hidden << t2
            hidden << t3
            hidden << t4
            visible = Array.new
            visible << t5
            visible << t6
            visible << t7
            visible << t8

            p.setVisibleTreasureList(visible)
            p.setHiddenTreasureList(hidden)
            psec1.setVisibleTreasureList(visible)
            psec1.setHiddenTreasureList(hidden)
            psec2.setVisibleTreasureList(visible)
            psec2.setHiddenTreasureList(hidden)

            puts "Tras añadir tesoros:\n\n"
            puts p.to_s_xl  
            puts psec1.to_s_xl
            puts psec2.to_s_xl
           
        #############################################

            [p,psec2]
        end
>>>>>>> 4cb17ee17b6f633c452c7ed66cc4f395aad0713d

    def instance
    end

    def self.countRunExecutions
      @@countRunExecutions
    end

    def self.run ## INSTANCE METHOD run

      # Count the execution
      @@countRunExecutions += 1
 
      #--------------- USUAL PLAYERS ---------------#

      p1 = Player.new("Jugador 1")
      p2 = Player.new("Jugador 2")

      #------------------ TREASURES ------------------#

      tArmor = Model::Treasure.new("Armadura",600,5,6,Model::TreasureKind::ARMOR)
      tBothhands = Model::Treasure.new("Dos manos",600,4,8,Model::TreasureKind::BOTHHANDS)
      tHelmet = Model::Treasure.new("Casco",400,2,3,Model::TreasureKind::HELMET)
      tNecklace = Model::Treasure.new("Collar",1000,0,0,Model::TreasureKind::NECKLACE)
      tOnehand1 = Model::Treasure.new("Una mano 1",400,3,6,Model::TreasureKind::ONEHAND)
      tOnehand2 = Model::Treasure.new("Una mano 2",300,2,3,Model::TreasureKind::ONEHAND)
      tShoe = Model::Treasure.new("Calzado",600,3,4,Model::TreasureKind::SHOE)

      # Arrays for the treasures
      hidden = Array.new
      hidden << tArmor
      hidden << tBothhands
      hidden << tHelmet
      visible = Array.new
      visible << tOnehand1
      visible << tShoe
      visible << tNecklace

      #--------------- CULTIST CARDS ---------------#

      cult1 = Cultist.new("Sectario 1",2)
      cult2 = Cultist.new("Sectario 2",2)

      #------------------ OPERATIONS ------------------#

      # PARTE 2.A

      # Set players treasures
      p1.setVisibleTreasureList(visible)
      p1.setHiddenTreasureList(hidden)
      p2.setVisibleTreasureList(visible)
      p2.setHiddenTreasureList(hidden)

      # Print the tresures
      puts "Visible treasures:"
      visible.each do |t|
        puts t
      end
      puts "Hidden treasures:"
      hidden.each do |t|
        puts t
      end

      # Print players and combat level
      puts "\nPlayers:"
      puts p1.to_s_xl  
      puts p2.to_s_xl  
      puts "Player 1 combat level: " + p1.getCombatLevel.to_s
      puts "Player 2 combat level: " + p2.getCombatLevel.to_s

      # Convert p1 to cultist
      p1 = CultistPlayer.new(p1,cult1)

      # Print players and combat level
      puts "\nPlayers:"
      puts p1.to_s_xl  
      puts p2.to_s_xl  
      puts "Player 1 combat level: " + p1.getCombatLevel.to_s
      puts "Player 2 combat level: " + p2.getCombatLevel.to_s
      
      # Convert p2 to cultist
      p2 = CultistPlayer.new(p2,cult2)

      # Print players and combat level
      puts "\nPlayers:"
      puts p1.to_s_xl  
      puts p2.to_s_xl  
      puts "Player 1 combat level: " + p1.getCombatLevel.to_s
      puts "Player 2 combat level: " + p2.getCombatLevel.to_s

      p1.setVisibleTreasureList([])
      p1.setHiddenTreasureList([])
      p2.setVisibleTreasureList([])
      p2.setHiddenTreasureList([])

      # Print players and combat level
      puts "\nPlayers:"
      puts p1.to_s_xl  
      puts p2.to_s_xl  
      puts "Player 1 combat level: " + p1.getCombatLevel.to_s
      puts "Player 2 combat level: " + p2.getCombatLevel.to_s

      # PARTE 2.B
  
      #----------------- BAD CONSEQUENCES ------------------#

      # Number Treasures
      badConsNT = BadConsequenceNumberTreasures.new("Bad consequence NT", 0, 4, 0)
      # Specific Treasures
      badConsST = BadConsequenceSpecificTreasures.new("Bad consequence ST", 3, 
        [TreasureKind::ONEHAND, TreasureKind::ONEHAND], [])
      # Death
      badConsDeath = BadConsequenceDeath.new("Bad Consequence Death")

      # Adjust the bad consequences to hidden and visible treasures
      puts "\nBad Consequence Number Treasures:"
      puts badConsNT.to_s
      newBadCons = badConsNT.adjustToFitTreasureLists(visible, hidden)
      puts "\nBad Consequence Number Treasures Adjusted:"
      puts newBadCons.to_s
      
      puts "\nBad Consequence Specific Treasures:"
      puts badConsST.to_s
      newBadCons = badConsST.adjustToFitTreasureLists(visible, hidden)
      puts "\nBad Consequence Specific Treasures Adjusted:"
      puts newBadCons.to_s

      puts "\nBad Consequence Death"
      puts badConsDeath.to_s
      newBadCons = badConsDeath.adjustToFitTreasureLists(visible, hidden)
      puts "\nBad Consequence Death Adjusted:"
      puts newBadCons.to_s
    end
  end

  Examen4.run
  puts "Times run has been executed: " + Examen4.countRunExecutions.to_s
end
