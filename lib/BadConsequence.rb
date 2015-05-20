#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

class BadConsequence
  def initialize(text = "",levels = 0)
    @text = text
    @levels = levels
  end

  attr_reader :text, :levels

  def isEmpty
    true
  end

  def kills
    false
  end

  def substractVisibleTreasure(t)
  end

  def substractHiddenTreasure(t)
  end

  def to_s
    "Esto es un mal rollo con el siguiente contenido:" +
    "\n\tText = #{@text}" +
    ((@levels > 0)?("\n\tLevels = #{@levels}"):(""))
  end

  def adjustToFitTreasureLists(v, h)
  end

end

require_relative './BadConsequenceNumberTreasures.rb'
require_relative './BadConsequenceSpecificTreasures.rb'
require_relative './BadConsequenceDeath.rb'