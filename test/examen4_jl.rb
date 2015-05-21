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
    class Examen4
        @@NUMBER_RUNS=0
        def self.run
            @@NUMBER_RUNS+=1
            p1 = Player.new("J1")
            p2 = Player.new("J2")
       
            
        
            t1 = Treasure.new("¡Sí mi amo!",0,4,7,TreasureKind::HELMET)

    
            t2 = Treasure.new("Botas de investigación",600,3,4,TreasureKind::SHOE)

            tOne1 = Treasure.new("Clavo de rail ferroviario",400,3,6,TreasureKind::ONEHAND)


            t3 = Treasure.new("¡Sí mi amo 2!",0,4,7,TreasureKind::HELMET)

    
            t4 = Treasure.new("Botas de investigación 2",600,3,4,TreasureKind::SHOE)

            tOne2 = Treasure.new("Otra mano",400,3,6,TreasureKind::ONEHAND)
            visible = [t1,t2,tOne1]
            hidden = [t3,t4,tOne2]

            p1.setVisibleTreasureList(visible)
            p2.setVisibleTreasureList(visible)
           
            p1.setHiddenTreasureList(hidden)
            p2.setHiddenTreasureList(hidden)
         

            puts p1.to_s_xl
            puts p2.to_s_xl

            puts "El estado completo de los tesoros viene implícito en los jugadores, al tener las mismas listas"
            cult1 = Cultist.new("SECTARIO 1",1)
            cult2 = Cultist.new("SECTARIO 2",2)
            c1 = CultistPlayer.new(p1,cult1)
            p1 = c1
            puts p1.to_s_xl
            puts p2.to_s_xl

            c2 = CultistPlayer.new(p2,cult2)
            p2 = c2
            puts p1.to_s_xl
            puts p2.to_s_xl

            p1.setVisibleTreasureList([])
            p1.setHiddenTreasureList([])
            p2.setVisibleTreasureList([])
            p2.setHiddenTreasureList([])

            puts p1.to_s_xl
            puts p2.to_s_xl

            ################ PARTE B

            bad1 = BadConsequenceNumberTreasures.new("Bad1",0,4,0)
            puts bad1.to_s
            bad1adj = bad1.adjustToFitTreasureLists(visible,hidden)
            puts bad1adj

            bad2 = BadConsequenceSpecificTreasures.new("Bad2",0,[TreasureKind::ONEHAND,TreasureKind::ONEHAND,TreasureKind::BOTHHANDS],[])
            puts bad2.to_s
            bad2adj = bad2.adjustToFitTreasureLists(visible,hidden)
            puts bad2adj

            bad3 = BadConsequenceDeath.new("Bad3")
            puts bad3.to_s
            bad3adj = bad3.adjustToFitTreasureLists(visible,hidden)
            puts bad3adj

        end
        def self.getNumberRuns
            @@NUMBER_RUNS
        end
    end
end

Model::Examen4.run
puts Model::Examen4.getNumberRuns