require 'pry'

class Parser
  class << self
    def execute(code:)
      s_to_array(s_exp(code))
    end

    private
    
    def to_atom(element)
      res = element.match(%r{\".*\"})
      if res
        element.gsub('"', '')
      else
        element.to_sym
      end
    end

    def s_exp(code)
      code.gsub('(', ' ( ').gsub(')', ' ) ').split
    end
    
    def s_to_array(code)
      scope = 0
      code.drop(1).each_with_object([]) do |element, s|
        case element
        when '('
          scope += 1
          s << 
        when ')'
          scope -= 1
        else
          if scope == 0
            s << to_atom(element)
          else
            s[scope] << to_atom(element)
          end
        end
      end
    end
  end
end
