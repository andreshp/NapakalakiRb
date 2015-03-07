
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
	
	def self.new_by_number(text, levels, nVisible, nHidden)
		@text = text
		@levels = levels
		@nVisibleTreasures = nVisible
		@nHiddenTreasures = nHidden

		@specificVisibleTreasures = nil
		@specificHiddenTreasures = nil
	end

	def self.new_by_death(text,death)
		@text = text
		@death = death

		@nHiddenTreasures = 0
		@nVisibleTreasures = 0

		@specificVisibleTreasures = nil
		@specificHiddenTreasures = nil
	end

	def self.new_by_specific(text, levels, tVisible, tHidden)
		@text = text
		@death = death

		@specificHiddenTreasures = tHidden
		@specificVisibleTreasures = tVisible

		@nHiddenTreasures = 0
		@nVisibleTreasures = 0
	end
	
	attr_reader :text, :levels, :nVisibleTreasures, :nHiddenTreasures
	#esto o getText, getLevels, etc.?

	def toString()
		  return 'Text = ' + @text + '\nLevels = ' + @levels + '\nnVisibleTreasures = '\
		  + @nVisibleTreasures + '\nnHiddenTreasures = ' + @nHiddenTreasures + '\nDeath = ' + @death
	end
end


