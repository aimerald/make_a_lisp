-module(parser).
-export([execute/1, read_from/1, while/1, to_atom/1]).

execute(Token) ->
		Tokens = compact(Token),
		Tokens.
		%% read_from(Tokens).

tokenize(Token)->
		S = re:replace(Token, "\\(", " ( ", [global, {return, list}]),
		R = re:replace(S, "\\)", " ) ", [global, {return, list}]),
		re:split(R, " ", [{return, list}]).

compact(Token) ->
		T = tokenize(Token),
		[L || L <- T, length(L) >= 1].

to_atom(Value) ->
		{_, CondFloat} = re:compile("[0-9]+\.[0-9]+"),
		RegFloat = re:run(Value, CondFloat),
		case RegFloat of
				{match, _} ->
						hd(string:to_float(Value))
		end.

type_translate(Token) ->
		[to_atom(Value) || Value <- Token].

read_from(X) ->
		type_translate(X).

while(X) ->
		X.

%% read_from(Tokens) ->
%%  		[Car|Cdr] = Tokens,
%%  		read_from(Car, Cdr).
%%  
%% read_from("(", Cdr) ->
%%  		while(Cdr);
%% read_from(")", Cdr) ->
%%  		read_from(Cdr);
%% read_from(Car, _) ->
%%  		[Car].
%%  
%% while(List) ->
%%  		[H|T] = List,
%%  		L = [],
%%  		while(H,T,L).
%%  
%% while(H, _, L) when H == ")" ->
%%  		L;
%% while(H, T, L) ->
%%  		[Car|Cdr] = T,
%%  		while(Car, Cdr, lists:append(L, [H])).
