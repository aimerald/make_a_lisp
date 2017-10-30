require 'pry'
require './lib/basic_func'

class Eval
  class << self
    def execute(list:)
      stack = list.map do |atom|
        case atom
        when :if, :cond
          list.shift
          if evaluate(list.shift)
            list.pop
          else
            list.shift
          end
          return evaluate(list.first)
        when :lambda
          binding.pry
        when Array
          execute(list: atom)
        else
          atom
        end
      end
      evaluate(stack)
    end

    private

    def car(list)
      list.first
    end

    def cdr(list)
      list.drop(1)
    end

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
