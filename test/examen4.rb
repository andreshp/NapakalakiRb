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

    end

    class ExamenHijo < Examen
        def initialize
        end

        def run
          r = super
          psec2 = r.pop
          p = r.pop
          puts p.to_s_xl
          # Monster: Bicéfalo
          badConsequence = BadConsequenceSpecificTreasures.new(
            "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
            [TreasureKind::ONEHAND, TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
          prize = Prize.new(1,1)
          m1 = Monster.new("Bicéfalo", 20, badConsequence, prize)

          # Monster (with cultists): El mal indecible impronunciable
          badConsequence = BadConsequenceSpecificTreasures.new("Pierdes 1 mano visible.",0,
            [TreasureKind::ONEHAND],[])
          prize = Prize.new(3,1)
          m2 = Monster.new("El mal indecible impronunciable",10,badConsequence,prize,-2)

          # Monster (with cultists): Testigos oculares
          badConsequence = BadConsequenceNumberTreasures.new("Pierdes tus tesoros visibles. Jajaja.",0,100,0)
          prize = Prize.new(2,1)
          m3 = Monster.new("Testigos oculares",6,badConsequence,prize,6)

          puts "Niveles monstruos (p/psec2)"
          puts p.getOponentLevel(m1).to_s
          puts psec2.getOponentLevel(m1).to_s
          puts p.getOponentLevel(m2).to_s
          puts psec2.getOponentLevel(m2).to_s
          puts p.getOponentLevel(m3).to_s
          puts psec2.getOponentLevel(m3).to_s

        #################################################
            p.buyLevels(p.getVisibleTreasures,[])
            psec2.buyLevels(psec2.getVisibleTreasures,[])
            puts "Tras comprar tesoros:\n\n"

            puts p.to_s_xl
            puts psec2.to_s_xl
        end

    end
    ExamenHijo.new.run
end
