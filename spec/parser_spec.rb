require 'pry'
require 'parser'

RSpec.describe "Parser.executeにS式を渡すと配列になる" do 
  it "(print 'hello') -> [:print, 'hello']" do
    code = '(print "hello")'
    expect(Parser.execute(code: code)).to eq([:print, "hello"])
  end

  it "(print (join 'hello' 'world')) -> [:print, [:join, 'hello', 'world']" do
    code = '(print (join "hello" "world"))'
    expect(Parser.execute(code: code)).to eq([:print, [:join, "hello", "world"]])
  end
   
  it "(print (join (join 'think' 'different') 'this' 'is' (join 'apple' 'world!')))" do
    code = '(print (join (join "think" "different") "this" "is" (join "apple" "world!")))'
    expects = [:print, [:join, [:join, "think", "different"], "this", "is", [:join, "apple", "world!"]]]
    expect(Parser.execute(code: code)).to eq(expects)
  end
  
  # it "(sum 1 2) -> [:sum, 1, 2]" do
  #   code = '(sum 1 2)'
  #   expect(Parser.execute(code: code)).to eq([:sum, 1, 2])
  # end
end
