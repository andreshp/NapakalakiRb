module Napakalaki
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
		
		attr_reader :text :levels :nVisibleTreasures :nHiddenTreasures
		#esto o getText, getLevels, etc.?

		def toString()
			return 'Text = ' + @text + '\nLevels = ' + @levels + '\nnVisibleTreasures = '\
			+ @nVisibleTreasures + '\nnHiddenTreasures = ' + @nHiddenTreasures + '\nDeath = ' + @death
		end


