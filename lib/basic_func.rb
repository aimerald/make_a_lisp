require 'pry'
require 'active_support'

class BasicFunc
  class << self
    def import
      {
        puts: -> list { puts list },
        car: -> list { list.first },
        cdr: -> list { list.drop(1) },
        atom: -> list { list.first.nil? || list.first.class == String || list.first.class == Fixnum },
        eq: -> list { list[0] == list[1] },
        cons: -> list { list },
        "+": -> list { list.inject(:+) },
       "-": -> list { list.inject(:-) },
       "*": -> list { list.inject(:*) },
       "/": -> list { list.inject(:/) },
       mod: -> list { list.inject(:%) }
      }
    end
  end
end
