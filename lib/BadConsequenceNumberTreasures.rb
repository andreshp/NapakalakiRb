#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative './BadConsequence.rb'

class BadConsequenceNumberTreasures < BadConsequence
  def initialize(text,levels,nVisible,nHidden)
    super(text,levels)
    @nVisibleTreasures = nVisible
    @nHiddenTreasures = nHidden
  end

  def isEmpty
    @nVisibleTreasures == 0 and @nHiddenTreasures == 0
  end

  def kills
    false
  end

  def substractVisibleTreasure(t)
    @nVisibleTreasures = [0, @nVisibleTreasures-1].max
  end

  def substractHiddenTreasure(t)
    @nHiddenTreasures = [0, @nVisibleTreasures-1].max
  end

  def to_s
    super + "\n\tnVisibleTreasures = #{@nVisibleTreasures}\n\tnHiddenTreasures = #{@nHiddenTreasures}"
  end

  def adjustToFitTreasureLists(v,h)
    nVisible = [@nVisibleTreasures, v.size].min
    nHidden = [@nHiddenTreasures, h.size].min
    badCons = BadConsequenceNumberTreasures.new("Falta por cumplir:",0,nVisible,nHidden)
    badCons
  end
end
