-module(parser).
-export([execute/1]).

execute(Token) ->
		compact(Token).

tokenize(Token)->
		S = re:replace(Token, "\\(", " ( ", [{return, list}]),
		R = re:replace(S, "\\)", " ) ", [{return, list}]),
		re:split(R, " ", [{return, list}]).

compact(Token) ->
		T = tokenize(Token),
		[L || L <- T, length(L) >= 1].
