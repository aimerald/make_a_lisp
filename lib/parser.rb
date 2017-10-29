require 'pry'

class Parser
  class << self
    def execute(code:)
      read_from(tokenize(code))
    end

    private

    def read_from(tokens)
      raise StandardError('unexpected EOF while reading') if tokens.length == 0
      token = tokens.shift
      if '(' == token
        list = []
        while tokens[0] != ')'
          list << read_from(tokens)
        end
        tokens.shift
        list
      elsif ')' == token
        raise StandardError('unexpected')
      else
        atom(token)
      end
    end

    def atom(token)
      if token.match(/^[0-9].$/)
        token.to_i
      elsif token.match(%r{\".*\"})
        token.gsub('"', '')
      else
        token.to_sym
      end
    end

    def tokenize(s)
      s.gsub('(', ' ( ').gsub(')', ' ) ').split(' ')
    end
  end
end
