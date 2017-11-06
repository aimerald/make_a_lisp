require 'pry'
require 'eval'
require 'parser'

RSpec.describe "LispをLispにしているもの" do 
  it ':lambdaはラムダ記法を扱う' do
    code = '(lambda (a b) (+ a b))'
    list = Parser.execute(code: code)
    # expect(Eval.execute(list: list)).to eq(200)
  end
end
