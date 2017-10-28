class Element
  attr_reader :atom
  def initialize(value)
    @atom = to_atom(value)
  end

  private

  def to_atom(atom)
    case atom
    when %r{\d+}
      atom.to_i
    when %r{\"(\w|\W)+\"}
      atom.gsub('"', '')
    else
      atom.to_sym
    end
  end
end
