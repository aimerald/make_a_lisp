require 'pry'
require 'eval'
require 'parser'

RSpec.describe '変数を扱えるようにする' do
  it '変数に値を代入した値を使える' do
    code = '((set a 1) (set b 2) (+ a b))'
    list = Parser.execute(code: code)
    expect(Eval.execute(list: list)).to eq(3)
  end

  it '変数に代入した値を使って計算ができる' do
    code = '((set a 11) (set b 22) (+ a b))'
    list = Parser.execute(code: code)
    expect(Eval.execute(list: list)).to eq(33)
  end
end
