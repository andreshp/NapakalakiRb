#encoding: utf-8

#!/usr/bin/env ruby

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/CardDealer.rb'
require_relative '../lib/Dice.rb' #Just for the dice.

#--------------------- INITIALIZE THE CARDS DECK ---------------------#

cards = Model::CardDealer.instance
cards.initCards

#--------------------- OPERATIONS WITH THE DECKS ---------------------#

# Monstruos con nivel superior a 10
puts "\nMonstruos con nivel superior a 10:\n\n"
for i in 1..19
    monster = cards.nextMonster
        if monster.combatLevel > 10
            puts monster.to_s + "\n\n"
        end
    cards.giveMonsterBack(monster)
end

# Monstruos con mal rollo que afecta solo a niveles
puts "\nMonstruos con mal rollo que afecta solo a niveles:\n\n"
for i in 1..19
    monster = cards.nextMonster
    if monster.badCons.levels > 0 && monster.badCons.nVisibleTreasures == 0 && monster.badCons.nHiddenTreasures == 0 &&
       monster.badCons.specificHiddenTreasures == nil && monster.badCons.specificVisibleTreasures == nil && monster.badCons.death == false 
        puts monster.to_s + "\n\n"
    end
    cards.giveMonsterBack(monster)
end

# Monstruos con buen rollo con ganancia de nivel superior a 1
puts "\nMonstruos con buen rollo con ganancia de nivel superior a 1:\n\n"
for i in 1..19
    monster = cards.nextMonster
    if monster.prize.levels > 1
        puts monster.to_s + "\n\n"
    end
    cards.giveMonsterBack(monster)
end

# Monstruos cuyo mal rollo implica la pérdida de una mano
puts "\nMonstruos cuyo mal rollo implica la pérdida de una mano:\n\n"
for i in 1..19
    monster = cards.nextMonster
    if monster.badCons.specificVisibleTreasures != nil and monster.badCons.specificVisibleTreasures.include? Model::TreasureKind::ONEHAND
        puts monster.to_s + "\n\n"
    end
    if monster.badCons.specificHiddenTreasures != nil and monster.badCons.specificHiddenTreasures.include? Model::TreasureKind::ONEHAND 
        puts monster.to_s + "\n\n"
    end
    cards.giveMonsterBack(monster)
end

# Tesoros cuyo bonus no mejora aunque lleves el collar:
puts "\nTesoros cuyo bonus no mejora aunque lleves el collar:\n\n"
for i in 1..32
    treasure = cards.nextTreasure
    if treasure.minBonus == treasure.maxBonus
        puts treasure.to_s + "\n\n"
    end
    cards.giveTreasureBack(treasure)
end

# Tesoros que proporcionan 100 o menos monedas:
puts "\nTesoros que proporcionan 100 o menos monedas:\n\n"
for i in 1..32
    treasure = cards.nextTreasure
    if treasure.goldCoins <= 100
        puts treasure.to_s + "\n\n"
    end
    cards.giveTreasureBack(treasure)
end

# Tesoros que puedes llevar en las manos:
puts "\nTesoros que puedes llevar en las manos:\n\n"
for i in 1..32
    treasure = cards.nextTreasure
    if treasure.kind == Model::TreasureKind::ONEHAND || treasure.kind == Model::TreasureKind::BOTHHANDS
        puts treasure.to_s + "\n\n"
    end
    cards.giveTreasureBack(treasure)
end

# Tesoros que empiezan por 'Necro':
puts "\nTesoros que empiezan por 'Necro':\n\n"
for i in 1..32
    treasure = cards.nextTreasure
    if treasure.name.start_with?("Necro")
        puts treasure.to_s + "\n\n"
    end
    cards.giveTreasureBack(treasure)
end

# -- TESTING THE DICE -- #
dice = Model::Dice.instance
puts "\nTesting the dice: "

for i in 1..28
    print "#{dice.nextNumber} "
end
puts "\n"