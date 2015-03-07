require_relative 'BadConsequence.rb' # para poder acceder a lo definido en el fichero un_modulo.rb
require_relative 'Prize.rb'
require_relative 'Monster.rb'


bc2 = BadConsequence.new_by_death("Hola",true)


pr = Prize.new(28,28)
puts pr.toString()


puts bc2.toString()

bad28 = BadConsequence.new_by_number("El 28 te destrozará la vida muajajajajajajajajajajaja. Pierdes 28 de todo lo que se pueda perder",28,28,28)
monster28 = Monster.new("Veintiochostruo",28,bad28,pr)

puts monster28.toString()



