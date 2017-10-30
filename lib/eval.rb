require 'pry'
require 'basic_func'

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
      env = BasicFunc.import
      case list.first
      when Symbol
        env[list.first][list.drop(1).flatten]
      else
        list
      end
    end
  end
end
