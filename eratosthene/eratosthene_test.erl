-module(eratosthene_test).

-include_lib("eunit/include/eunit.hrl").

remove_multiple_of_two_test() ->
    ?assertEqual([9,7,5,3,1], premier:remove_multiple_by_two(lists:seq(1, 10))),
    ?assertEqual([14,5,7], premier:remove_multiple_by_three([9, 21, 7, 5, 18,14])),
    ?assertEqual([9,8,7,6,4,3,2,1], premier:remove_multiple_by_five(lists:seq(1, 10))),
    ?assertEqual([19,17,13,11,7,1], premier:remove_multiples(lists:seq(1, 20))).


is_number_premier_test() ->
    ?assertEqual([2,3,5,7],premier:eratosthenes(10)).