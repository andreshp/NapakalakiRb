######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################
class BadConsequence		

=begin No puedo poner los tres :(
	def initialize(text, levels, nVisible, nHidden)
		  @text = text
		  @levels = levels
		  @nVisibleTreasures = nVisible
		  @nHiddenTreasures = nHidden

	end

	def initialize(text,death)
		  @text = text
		  @death = death

			@nHiddenTreasures = 0
		  @nVisibleTreasures = 0
	end

	def initialize(text, levels, tVisible, tHidden)
		  @text = text
		  @levels = levels
		  @specificVisibleTreasures = tVisible
		  @specificHiddenTreasures = tHidden
	end
=end
	def initialize(text,levels,death,nVisible,nHidden,tVisible,tHidden)
		@text = text
		@death = death
		@levels = levels

		@nVisibleTreasures = nVisible
		@nHiddenTreasures = nHidden

		@specificVisibleTreasures = tVisible
		@specificHiddenTreasures = tHidden
	end

	##########
	########## new_* methods need to review default values
	##########
	def self.new_by_number(text, levels, nVisible, nHidden)
		new(text,levels,false,nVisible,nHidden,nil,nil)
	end	

	def self.new_by_death(text,death)
		new(text,0,death,0,0,nil,nil)
		
	end

	def self.new_by_specific(text, levels, tVisible, tHidden)
		new(text,levels, false, 0, 0, tVisible, tHidden)
	end
	
	attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures, :death
	#esto o getText, getLevels, etc.?

	#Anula el método constructor new para que no podamos usarlo tal cual  
	private_class_method :new

	def toString()
		  return "Text = " + text.to_s + "\nLevels = " + levels.to_s + "\nnVisibleTreasures = "\
		  + nVisibleTreasures.to_s + "\nnHiddenTreasures = " + nHiddenTreasures.to_s + "\nDeath = " + death.to_s
	end
end


