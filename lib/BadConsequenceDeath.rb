#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative './BadConsequence.rb'

class BadConsequenceDeath < BadConsequence
  def initialize(text)
    super
  end

  def isEmpty
    true
  end

  def kills
    true
  end

  def substractVisibleTreasure(t)
  end

  def substractHiddenTreasure(t)
  end

  def to_s
    super + "\n\tCAUSA LA MUERTE"
  end

  def adjustToFitTreasureLists(v, h)
  end

end