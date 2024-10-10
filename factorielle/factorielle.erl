-module(factorielle).
-export([factoriel/1]).

factoriel(0)->
    1;
factoriel(N) when N >0->
    N*factoriel(N-1).
    