#!/usr/bin/env ruby

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/Monster.rb'

#--------------------- CREACIÓN DE LOS MONSTRUOS ---------------------#

# Definición del mazo de monstruos:
monsters = Array.new

# Monster: 3 Byakhees de de bonanza
badConsequence = BadConsequence.newSpecificTreasures(
    "Pierdes tu armadura visible y tu armadura oculta.", 0,
    [TreasureKind::ARMOR],[TreasureKind::ARMOR])
prize = Prize.new(2,1)
monsters << Monster.new("3 Byakhees de bonanza", 8, badConsequence, prize)

# Monster: Chibithulhu
badConsequence = BadConsequence.newSpecificTreasures(
    "Embobados con el lindo primigenio te descartas de tu casco visible.",0,
    [TreasureKind::HELMET], [])
prize = Prize.new(1,1)
monsters << Monster.new("Chibithulhu",2, badConsequence, prize)

#  Monster: El sopor de Dunwich
badConsequence = BadConsequence.newSpecificTreasures(
    "El primordial bostezo contagioso. Pierdes el calzado visible.", 0,
    [TreasureKind::SHOE], [])
prize = Prize.new(1,1)
monsters << Monster.new("El sopor de Dunwich", 2, badConsequence, prize)

# Monster: Ángeles de la noche ibicenca
badConsequence = BadConsequence.newSpecificTreasures(
    "Te atrapan para llevarte de fiesta y te dejan caer. Descarta 1 mano visible y 1 mano oculta.",0,
    [TreasureKind::ONEHAND], [TreasureKind::ONEHAND])
prize = Prize.new(4,1)
monsters << Monster.new("Ángeles de la noche ibicenca",14,badConsequence,prize)

# Monster: El gorrón en el umbral.
badConsequence = BadConsequence.newNumberOfTreasures(
    "Pierdes todos tus tesoros visibles.", 0, 100, 0)
prize = Prize.new(3,1)
monsters << Monster.new("El gorrón en el umbral", 10, badConsequence, prize)

# Monster: H. P.  Munchcraft.
badConsequence = BadConsequence.newSpecificTreasures(
    "Pierdes la armadura visible.", 0,
    [TreasureKind::ARMOR], [])
prize = Prize.new(2,1)
monsters << Monster.new("H. P. Munchcraft", 6, badConsequence, prize)

# Monster: Bichgooth
badConsequence = BadConsequence.newSpecificTreasures(
    "Sientes bichos bajo la ropa. Descarta la armadura visible.",0,
    [TreasureKind::ARMOR], [])
prize = Prize.new(1,1)
monsters << Monster.new("Bichgooth",2, badConsequence, prize)

# Monster: El rey de la rosa
badConsequence = BadConsequence.newNumberOfTreasures(
    "Pierdes 5 niveles y 3 tesoros visibles.",5,3,0)
prize = Prize.new(4,2)
monsters << Monster.new("El rey de la rosa", 13, badConsequence, prize)

# Monster: La que redacta en las tinieblas
badConsequence = BadConsequence.newNumberOfTreasures(
    "Toses los pulmones y pierdes 2 niveles.", 2, 0, 0)
prize = Prize.new(1,1)
monsters << Monster.new("La que redacta en las tinieblas", 2, badConsequence, prize)

# Monster: Los hondos
badConsequence = BadConsequence.newDeath(
    "Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto.")
prize = Prize.new(2,1)
monsters << Monster.new("Los hondos", 8, badConsequence, prize)

# Monster: Semillas Cthulhu
badConsequence = BadConsequence.newNumberOfTreasures(
    "Pierdes 2 niveles y 2 tesoros ocultos.",2,0,2)
prize = Prize.new(2,1)
monsters << Monster.new("Semillas Cthulhu", 4, badConsequence, prize)

# Monster: Dameargo
badConsequence = BadConsequence.newSpecificTreasures(
    "Te intentas escaquear. Pierdes una mano visible.",0,
    [TreasureKind::ONEHAND], [])
prize = Prize.new(2,1)
monsters << Monster.new("Dameargo", 1, badConsequence, prize)

# Monster: Pollipólipo volante
badConsequence = BadConsequence.newNumberOfTreasures(
    "Da mucho asquito. Pierdes 3 niveles.", 3, 0, 0)
prize = Prize.new(1,1)
monsters << Monster.new("Pollipólipo volante", 3, badConsequence, prize)

# Monster: Yskhtihyssg-Goth
badConsequence = BadConsequence.newDeath(
    "No le hace gracia que pronuncien mal su nombre. Estás muerto.")
prize = Prize.new(3,1)
monsters << Monster.new("Yskhtihyssg-Goth", 12, badConsequence, prize)

# Monster: Familia feliz
badConsequence = BadConsequence.newDeath(
    "La familia te atrapa. Estás muerto.")
prize = Prize.new(4,1)
monsters << Monster.new("Familia feliz", 1, badConsequence, prize)

# Monster: Roboggoth
badConsequence = BadConsequence.newSpecificTreasures(
    "La quinta directiva primaria te obliga a perder 2 niveles y un tesoro de 2 manos visible.",2,
    [TreasureKind::BOTHHANDS],[])
prize = Prize.new(2,1)
monsters << Monster.new("Roboggoth", 8, badConsequence, prize)

# Monster: El espía
badConsequence = BadConsequence.newSpecificTreasures(
    "Te asusta en la noche. Pierdes un casco visible.",0,
    [TreasureKind::HELMET],[])
prize = Prize.new(1,1)
monsters << Monster.new("El espía",5,badConsequence,prize)

# Monster: El lenguas
badConsequence = BadConsequence.newNumberOfTreasures(
    "Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles.",
    2, 5, 0)
prize = Prize.new(1,1)
monsters << Monster.new("El lenguas", 20, badConsequence, prize)

# Monster: Bicéfalo
badConsequence = BadConsequence.newSpecificTreasures(
    "Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos.",3,
    [TreasureKind::ONEHAND, TreasureKind::BOTHHANDS],[])
prize = Prize.new(1,1)
monsters << Monster.new("Bicéfalo", 20, badConsequence, prize)


#--------------------- OPERACIONES CON LOS MONSTRUOS ---------------------#

# Monstruos con nivel superior a 10
puts "\nMonstruos con nivel superior a 10:\n\n"
monsters.each do |i|
    if i.combatLevel > 10
        puts i.to_s + "\n\n"
    end
end

# Monstruos con mal rollo que afecta solo a niveles
puts "\nMonstruos con mal rollo que afecta solo a niveles:\n\n"
monsters.each do |i|
    if i.badCons.levels > 0 && i.badCons.nVisibleTreasures == 0 && i.badCons.nHiddenTreasures == 0 &&
       i.badCons.specificHiddenTreasures == nil && i.badCons.specificVisibleTreasures == nil && i.badCons.death == false 
        puts i.to_s + "\n\n"
    end
end

# Monstruos con buen rollo con ganancia de nivel superior a 1
puts "\nMonstruos con buen rollo con ganancia de nivel superior a 1:\n\n"
monsters.each do |i|
    if i.prize.levels > 1
        puts i.to_s + "\n\n"
    end
end

# Monstruos cuyo mal rollo implica la pérdida de una mano
puts "\nMonstruos cuyo mal rollo implica la pérdida de una mano:\n\n"
monsters.each do |i|
    if i.badCons.specificVisibleTreasures != nil and i.badCons.specificVisibleTreasures.include? TreasureKind::ONEHAND
        puts i.to_s + "\n\n"
    end
    if i.badCons.specificHiddenTreasures != nil and i.badCons.specificHiddenTreasures.include? TreasureKind::ONEHAND 
        puts i.to_s + "\n\n"
    end
end

