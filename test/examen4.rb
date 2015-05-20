#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/Player.rb'
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

        def self.run ## CLASS METHOD run

        end

        def run ## INSTANCE METHOD run
            p = Player.new("Jugador examen.")
            cult1 = Cultist.new("SECTARIO 1",2)
            psec1 = CultistPlayer.new(p,cult1)

            puts "Inicio:\n\n"
            puts p.to_s
            puts "Tesoros visibles:\n\n"
            p.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            p.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

            puts psec1.to_s
            puts "Tesoros visibles:\n\n"
            psec1.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            psec1.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

    ##############################################
            t1 = Model::Treasure.new("Botas de investigación",600,3,4,Model::TreasureKind::SHOE)
            t2 = Model::Treasure.new("Ametralladora Thompson",600,4,8,Model::TreasureKind::BOTHHANDS)
            t3 = Model::Treasure.new("Clavo de rail ferroviario",400,3,6,Model::TreasureKind::ONEHAND)
            t4 = Model::Treasure.new("Cuchillo de Sushi arcano",300,2,3,Model::TreasureKind::ONEHAND)
            t5 = Model::Treasure.new("Otros tesoros1",400,2,3,Model::TreasureKind::HELMET)
            t6 = Model::Treasure.new("Otros tesoros2",600,5,6,Model::TreasureKind::ARMOR)
            t7 = Model::Treasure.new("Otros tesoros3",700,4,8,Model::TreasureKind::ONEHAND)
            t8 = Model::Treasure.new("Otros tesoros4",700,4,8,Model::TreasureKind::ONEHAND)
            hidden=Array.new
            hidden << t1
            hidden << t2
            hidden << t3
            hidden << t4
            visible = Array.new
            visible << t5
            visible << t6
            visiblesec = Array.new
            visiblesec << t7
            visiblesec << t8

            p.setVisibleTreasureList(visible)
            p.setHiddenTreasureList(hidden)
            psec1.setVisibleTreasureList(visiblesec)


            puts "Tras añadir tesoros:\n\n"
            puts p.to_s
            puts "Tesoros visibles:\n\n"
            p.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            p.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

            puts psec1.to_s
            puts "Tesoros visibles:\n\n"
            psec1.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            psec1.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

        #############################################
            cult2 = Cultist.new("Sectario 2",1)
            psec2 = CultistPlayer.new(p,cult2)

            puts "Tras añadir segundo sectario:\n\n"
            puts p.to_s
            puts "Tesoros visibles:\n\n"
            p.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            p.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

            puts psec1.to_s
            puts "Tesoros visibles:\n\n"
            psec1.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            psec1.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

            puts psec2.to_s
            puts "Tesoros visibles:\n\n"
            psec1.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            psec2.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
        #############################################


        end

    end

    class ExamenHijo < Examen
        def initialize
        end

        def run
          super
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
            psec2.buyLevels(p2.getVisibleTreasures,[])
            puts "Tras comprar tesoros:\n\n"

            puts p.to_s
            puts "Tesoros visibles:\n\n"
            p.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            p.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

            puts psec2.to_s
            puts "Tesoros visibles:\n\n"
            psec1.getVisibleTreasures.each do |i|
                puts i.to_s + "\n\n"
            end
            puts "Tesoros ocultos:\n\n"
            psec2.getHiddenTreasures.each do |i|
                puts i.to_s + "\n\n"
            end

        end

    end
end
#ExamenHijo.new.run