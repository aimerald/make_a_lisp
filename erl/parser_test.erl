-module(parser_test).
-include_lib("eunit/include/eunit.hrl").

tokenize_test() ->
		["+", 1, 2] == parser:tokenize("(+ 1 2)").

