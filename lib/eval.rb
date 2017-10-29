require 'pry'

class Eval
  class << self
    def execute(list:)
      stack = list.map do |atom|
        case atom
        when Array
          evaluate(atom)
        else
          atom
        end
      end
      evaluate(stack)
    end

    private

    def evaluate(list)
      env = global_env()
      case list.first
      when Symbol
        env[list.first][list.drop(1).flatten]
      else
        list
      end
    end

    def global_env
      {
        puts: -> list { puts list },
        car: -> list { list.first },
        cdr: -> list { list.drop(1) },
        "+": -> list { list.inject(:+) },
       "-": -> list { list.inject(:-) },
       "*": -> list { list.inject(:*) },
       "/": -> list { list.inject(:/) },
       mod: -> list { list.inject(:%) }
      }
    end
  end
end
