defmodule Parser do
	require Exlisp

	def read_from(code) do
		Exlisp.Parser.transform(code)
	end
end
