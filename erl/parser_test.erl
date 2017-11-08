-module(parser_test).
-include_lib("eunit/include/eunit.hrl").
-export([test/0]).

test() ->
		execute_is_return_tokenized_code().
		
execute_is_return_tokenized_code() ->
		% ?assertEqual(["+", 1, 2], parser:execute("(+ 1 2)")),
		% ?assertEqual("+", parser:to_atom("+")),
		% ?assertEqual(1, parser:to_atom("1")),
		?assertEqual(1.1, parser:to_atom("1.1")).
    %% ?assertEqual(["+", "1", "2"], parser:execute("(+ 1 2 (- 1 2))")),
		%% ?assertEqual(["+", "1", "2"], parser:execute("(+ 1 2 (* 1 2 (/ 10 20)) 10 20)")).		
