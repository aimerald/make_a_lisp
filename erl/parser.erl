-module(parser).
-export([execute/1, read_from/1]).

execute(Token) ->
		Tokens = compact(Token),
		read_from(Tokens).

tokenize(Token)->
		S = re:replace(Token, "\\(", " ( ", [global, {return, list}]),
		R = re:replace(S, "\\)", " ) ", [global, {return, list}]),
		re:split(R, " ", [{return, list}]).

compact(Token) ->
		T = tokenize(Token),
		[L || L <- T, length(L) >= 1].


read_from(Tokens) ->
		[Car|Cdr] = Tokens,
		read_from(Car, Cdr).

read_from("(", Cdr) ->
		List = [],
		[H|T] = Cdr,
		lists:append(List, read_from(H, T));
read_from(")", Cdr) ->
		read_from(Cdr);
read_from(Car, _) ->
		[Car].

while(List) ->
		
