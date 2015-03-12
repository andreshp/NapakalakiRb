#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

# Treasure Kind enumerate.
# It has symbols for each kind of treasure in the game.
# 
# A symbol in Ruby is like a string but inmutable
# and there is just one copy of the symbol in memory.
# A symbol is stored in the symbols table.
#
# Consequently, two symbols are equal if their id is the same.
# For strings you have to check their components since they
# might have the same content but different id.
# 
# This implies that working with symbols is much faster than working 
# with strings. That's why they are recommended when you don't need
# mutability or when mutability is a problem. Doing an enumerate
# fills in both cases.
# 
# @author andreshp, jlsuarez
module TreasureKind
    ARMOR     = :armor
    BOTHHANDS = :bothhands
    HELMET    = :helmet
    NECKLACE  = :necklace
    ONEHAND   = :onehand
    SHOE      = :shoe
end