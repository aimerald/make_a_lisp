require './lib/eval'
require './lib/parser'

while true
  puts '> input lisp code here!'
  code = gets
  puts "> #{code}"
  list = Parser.execute(code: code)
  puts "> #{Eval.execute(list: list)}"
end
