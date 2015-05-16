#encoding: utf-8

#######################################################################
# Authors: Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

# Necesita añadir los métodos:
# - Player::setHiddenTreasureList
require_relative '../lib/Napakalaki.rb'
require_relative '../lib/Player.rb'
require_relative '../lib/Dice.rb'
require_relative '../lib/Prize.rb'
require_relative '../lib/Treasure.rb'
require_relative '../lib/Monster.rb'
require_relative '../lib/CardDealer.rb'
require_relative '../lib/BadConsequence.rb'

class Examen
    def initialize
    
    end

    def self.run
        p = Model::Player.new("Jugador examen.")
        #Añadir tesoros:
        hidden = Array.new
        t1 = Model::Treasure.new("Botas de investigación",600,3,4,Model::TreasureKind::SHOE)
        t2 =  Model::Treasure.new("Ametralladora Thompson",600,4,8,Model::TreasureKind::BOTHHANDS)
        t3 = Model::Treasure.new("Clavo de rail ferroviario",400,3,6,Model::TreasureKind::ONEHAND)
        t4 = Model::Treasure.new("Cuchillo de Sushi arcano",300,2,3,Model::TreasureKind::ONEHAND)
        hidden=Array.new
        hidden << t1
        hidden << t2
        hidden << t3
        hidden << t4
        p.setHiddenTreasureList(hidden)

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
        #########################
        p.makeTreasureVisible(t3)
        puts "Hecho visible 1:\n\n"
        puts p.to_s
        puts "Tesoros visibles:\n\n"
        p.getVisibleTreasures.each do |i|
            puts i.to_s + "\n\n"
        end
        puts "Tesoros ocultos:\n\n"
        p.getHiddenTreasures.each do |i|
            puts i.to_s + "\n\n"
        end

        ############################
        p.makeTreasureVisible(t2)
        puts "Hecho visible 2:\n\n"
        puts p.to_s
        puts "Tesoros visibles:\n\n"
        p.getVisibleTreasures.each do |i|
            puts i.to_s + "\n\n"
        end
        puts "Tesoros ocultos:\n\n"
        p.getHiddenTreasures.each do |i|
            puts i.to_s + "\n\n"
        end

        ############################
        p.makeTreasureVisible(t4)
        puts "Hecho visible 3:\n\n"
        puts p.to_s
        puts "Tesoros visibles:\n\n"
        p.getVisibleTreasures.each do |i|
            puts i.to_s + "\n\n"
        end
        puts "Tesoros ocultos:\n\n"
        p.getHiddenTreasures.each do |i|
            puts i.to_s + "\n\n"
        end

        #############################
        puts "Bad1 ajustada\n\n"
        bc = Model::BadConsequence.newSpecificTreasures("Pierdes una mano visible",0,[Model::TreasureKind::ONEHAND],[])
    
        adjbc = bc.adjustToFitTreasureLists(p.getVisibleTreasures,p.getHiddenTreasures)

        puts adjbc.to_s

        ###########################
        puts "Bad2 ajustada\n\n"
        bc = Model::BadConsequence.newSpecificTreasures("Pierdes un armadura y un calzado oculto",0,
                [],[Model::TreasureKind::ARMOR,Model::TreasureKind::SHOE])

        adjbc = bc.adjustToFitTreasureLists(p.getVisibleTreasures,p.getHiddenTreasures)

        puts adjbc.to_s

        #########################
        puts "Estado antes de comprar:\n\n"
        puts p.to_s
        puts "Tesoros visibles:\n\n"
        p.getVisibleTreasures.each do |i|
            puts i.to_s + "\n\n"
        end
        puts "Tesoros ocultos:\n\n"
        p.getHiddenTreasures.each do |i|
            puts i.to_s + "\n\n"
        end

        ##########################
        puts "Estado después de comprar:\n\n"
        p.buyLevels(p.getVisibleTreasures,[])

        puts p.to_s
        puts "Tesoros visibles:\n\n"
        p.getVisibleTreasures.each do |i|
            puts i.to_s + "\n\n"
        end
        puts "Tesoros ocultos:\n\n"
        p.getHiddenTreasures.each do |i|
            puts i.to_s + "\n\n"
        end

    end

    
   

end
=begin
Treasure.new("¡Sí mi amo!",0,4,7,TreasureKind::HELMET)
Treasure.new("Capucha de Cthulhu",500,3,5,TreasureKind::HELMET)

Treasure.new("Botas de investigación",600,3,4,TreasureKind::SHOE)
Treasure.new("Zapato deja-amigos",500,0,1,TreasureKind::SHOE)

Treasure.new("La fuerza de Mr. T",1000,0,0,TreasureKind::NECKLACE)

Treasure.new("La rebeca metálica",400,2,3,TreasureKind::ARMOR)
Treasure.new("El aparato del Pr. Tesla",900,4,8,TreasureKind::ARMOR)

Treasure.new("Clavo de rail ferroviario",400,3,6,TreasureKind::ONEHAND)
Treasure.new("Cuchillo de Sushi arcano",300,2,3,TreasureKind::ONEHAND)

=end

Examen.run

