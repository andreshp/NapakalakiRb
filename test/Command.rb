# encoding: utf-8

module Test

  module Command  
    class Option
      attr_reader :menu, :text
      def initialize (aValue, aText)
        @menu = aValue
        @text = aText
      end
    end
    
    Exit = Option.new(0, "Salir")
    GoBack = Option.new(-1, "Menu anterior")
    Combat = Option.new(69, "¡¡ C O M B A T I R !!")
    ShowMonster = Option.new(10, "Mostrar monstruo")
    ShowVisibleTreasure = Option.new(11, "Mostrar tesoros visibles")
    ShowHiddenTreasure = Option.new(12, "Mostrar tesoros ocultos") 
    DiscardVisibleTreasure = Option.new(21, "Descartar tesoro visible")
    DiscardHiddenTreasure = Option.new(22, "Descartar tesoro oculto")
    MakeTreasureVisible = Option.new(23, "Equipar tesoro")
    BuyLevels = Option.new(33, "Comprar niveles")
    BuyWithVisibles = Option.new(31, "Añadir visibles a la lista de la compra")
    BuyWithHidden = Option.new(32, "Añadir ocultos a la lista de la compra")
    NextTurn = Option.new(1, "Siguiente turno")
    NextTurnAllowed = Option.new(2, "Siguiente turno permitido")
    
  end # del modulo Command
end # del mmodulo Test
