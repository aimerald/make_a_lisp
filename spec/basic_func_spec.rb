require 'pry'
require 'eval'

RSpec.describe "純Lispを作るために" do
  it ":carは配列の先頭を取得する" do
    list = [:car, ["hello", "world"]]
    expect(Eval.execute(list: list)).to eq('hello')
  end

  it ':cdrは配列の2個め以降を取得する'do
    list = [:cdr, ["hello", "world", "I am", "apple"]]
    expect(Eval.execute(list: list)).to eq(["world", "I am", "apple"])
  end

  it ':atomはatomならtrueを返す' do
    list_with_int = [:atom, 1]
    list_with_string = [:atom, "string"]
    list_with_nil = [:atom, nil]
    list_with_calc = [:atom, [:+, 2, 3]]
    expect(Eval.execute(list: list_with_int)).to eq(true)
    expect(Eval.execute(list: list_with_string)).to eq(true)
    expect(Eval.execute(list: list_with_nil)).to eq(true)
    expect(Eval.execute(list: list_with_calc)).to eq(true)
  end

  it ':eqは２つの値を比較する' do
    list_expect_true = [:eq, 1, 1]
    list_expect_false = [:eq, 1, 2]
    expect(Eval.execute(list: list_expect_true)).to eq(true)
    expect(Eval.execute(list: list_expect_false)).to eq(false)
  end

  it ':consは引数の値をまとめた新しい配列を返す' do
    list_expect_merge = [:cons, [1, 2], [3, 4]]
    expect(Eval.execute(list: list_expect_merge)).to eq([1,2,3,4])
  end

  it 'ちょっと複雑な計算をする' do
    list = [:+, [:cons, [1,2,3], [10, 20, 30]], 100, [:*, 10, 1]]
    expect(Eval.execute(list: list)).to eq(176)
  end
end
