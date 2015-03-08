#!/usr/bin/env ruby

######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative '../lib/BadConsequence.rb' # para poder acceder a lo definido en el fichero un_modulo.rb
require_relative '../lib/Prize.rb'
require_relative '../lib/Monster.rb'


pr = Prize.new(28,28)
bc2 = BadConsequence.new_by_death("Hola",true)
puts pr.toString(), "\n"
puts bc2.toString(), "\n"


bad28 = BadConsequence.new_by_number("El 28 te destrozará la vida muajajajajajajajajajajaja. Pierdes 28 de todo lo que se pueda perder",28,28,28)
monster28 = Monster.new("Veintiochostruo",28,bad28,pr)

puts monster28.toString
