require_relative 'Oystercard'

class Station

    attr_accessor :name, :zone

    def initialize(name, zone)
      @name = name
      @zone = zone
    end


end