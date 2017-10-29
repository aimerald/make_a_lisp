require 'pry'

class Parser
  class UnexpectedToken < StandardError; end
  class UnexpectedEOFWhileReading < StandardError; end
  class << self
    def execute(code:)
      read_from(tokenize(code))
    end

    private

    def read_from(tokens)
      raise UnexpectedEOFWhileReading if tokens.length == 0
      token = tokens.shift
      case token
      when '('
        list = []
        while tokens[0] != ')'
          list << read_from(tokens)
        end
        tokens.shift
        list
      when ')'
        tokens.shift
        read_from(tokens)
      else
        atom(token)
        end
    end

    def tokenize(s)
      s.gsub('(', ' ( ').gsub(')', ' ) ').split(' ')
    end

    def atom(token)
      if token.match(%r{^\d+$})
        token.to_i
      elsif token.match(%r{\".*\"})
        token.gsub('"', '')
      else
        token.to_sym
      end
    end
  end
end
