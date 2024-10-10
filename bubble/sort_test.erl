-module(sort_test).
-include_lib("eunit/include/eunit.hrl").

sort_test()->
    ?assertEqual([1, 2, 3, 4, 5], sort:sort([4,5,1,3,2])),
    ?assertEqual([1,3,5,7,8,9],sort:sort([7,8,9,5,1,3])).