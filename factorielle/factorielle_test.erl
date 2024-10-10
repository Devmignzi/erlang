-module(factorielle_test).
-include_lib("eunit/include/eunit.hrl").

facto_test()->
    ?assertEqual(120, factorielle:factoriel(5)),
    ?assertEqual(40320, factorielle:factoriel(8)).
    