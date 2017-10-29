require 'pry'
require 'eval'

RSpec.describe "Eval.executeにS式を配列にしたものを渡すと評価される" do
  it ":carは配列の先頭を取得する" do
    list = [:car, ["hello", "world"]]
    expect(Eval.execute(list: list)).to eq('hello')
  end

  it ':cdrは配列の2個め以降を取得する'do
    list = [:cdr, ["hello", "world", "I am", "apple"]]
    expect(Eval.execute(list: list)).to eq(["world", "I am", "apple"])
  end

  it ':putsは文字列を標準出力する' do
    list = [:puts, "hello world"]
    Eval.execute(list: list)
  end

  it ':+は数値を足し算する' do
    list = [:+, 1,2]
    expect(Eval.execute(list: list)).to eq(3)
  end

  it ':-は数値を引き算する' do
    list = [:-, 1, 2, 3]
    expect(Eval.execute(list: list)).to eq(-4)
  end

  it ':*は数値を掛け算する' do
    list = [:*, 1, 2, 3, 4, 5]
    expect(Eval.execute(list: list)).to eq(120)
  end

  it ":/は数値を割り算する" do
    list = [:/, 100, 5, 4]
    expect(Eval.execute(list: list)).to eq(5)
  end
  
  it ":/は数値を割り算し余りを返す" do
    list = [:mod, 10, 3]
    expect(Eval.execute(list: list)).to eq(1)
  end

  it '複数階層の計算も実行できる' do
    list = [:+, 1, [:-, 10, 5]]
    expect(Eval.execute(list: list)).to eq(6)
  end
end
