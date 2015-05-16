#encoding: utf-8

#######################################################################
# Authors: Andrés Herrera Poyatos, Juan Luis Suárez Díaz
# Universidad of Granada, March, 2015
# Programación Dirigida y Orientada a Objetos - Ruby Napakalaki
#######################################################################

require_relative './BadConsequence.rb'

class BadConsequenceSpecificTreasures < BadConsequence
  def initialize(text,levels,tVisible,tHidden)
    super(text,levels)
    @specificVisibleTreasures = tVisible
    @specificHiddenTreasures = tHidden
  end

  def isEmpty
    (@specificVisibleTreasures == nil or @specificVisibleTreasures.empty?) and
    (@specificHiddenTreasures == nil or @specificHiddenTreasures.empty?)
  end

  def kills
    false
  end

  def substractVisibleTreasure(t)
    place = @specificVisibleTreasures.index(t.kind)
    @specificVisibleTreasures.delete_at(place) if place != nil
  end

  def substractVisibleTreasure(t)
    place = @specificHiddenTreasures.index(t.kind)
    @specificHiddenTreasures.delete_at(place) if place != nil
  end

  def to_s
    # Variables
    specificVisibleStr = ""; specificHiddenStr = "";
    # Get the specific visible treasures
    if @specificVisibleTreasures == nil || @specificVisibleTreasures.empty?
      specificVisibleStr += "Ninguno"
    else
      @specificVisibleTreasures.each do |i|
        specificVisibleStr += "#{i} "
      end
    end
    # Get the specific hidden treasures
    if @specificHiddenTreasures == nil || @specificHiddenTreasures.empty?
      specificHiddenStr = "Ninguno"
    else
      @specificHiddenTreasures.each do |i|
        specificHiddenStr += "#{i} "
      end
    end
  
    super + "\n\tSpecificVisibleTreasures = #{specificVisibleStr.upcase}"+
        "\n\tSpecificVisibleTreasures = #{specificHiddenStr.upcase}"
  end
  
  def adjustToFitTreasureLists(v,h)
    pendingV = []; pendingH = []
    # Sort every array
    v = v.map(&:kind)
    h = h.map(&:kind)
    v.sort!
    h.sort!
    @specificVisibleTreasures.sort!
    @specificHiddenTreasures.sort!

    # Check which treasures put in the pending bad consequence
    i = 0
    for t in @specificVisibleTreasures
      while i < v.size and v[i] < t
        i += 1
      end          
      if v[i] == t
        pendingV << t
        i += 1
      end
      if i >= v.size
        break
      end
    end
    i = 0
    for t in @specificHiddenTreasures
      while i < h.size and h[i] < t
        i += 1
      end
      
      if h[i] == t
        pendingH << t
        i += 1
      end
      if i >= h.size
        break
      end
    end
    badCons = BadConsequenceSpecificTreasures.new("Falta por cumplir:",0,pendingV,pendingH)
    badCons
  end      
end