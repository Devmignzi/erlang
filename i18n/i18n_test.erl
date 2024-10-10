-module(i18n_test).
-include_lib("eunit/include/eunit.hrl").
 
 
i18n_test() ->
    ?assertEqual(true, i18n_verif:is_compliant("ma")),
    ?assertEqual(true, i18n_verif:is_compliant("m2a")),
    ?assertEqual(true, i18n_verif:is_compliant("je s2s a1e de 20 a1s")),
    ?assertEqual(true, i18n_verif:is_compliant("m1a")),
    ?assertEqual(true, i18n_verif:is_compliant("je    ")),
    ?assertEqual(true, i18n_verif:is_compliant(";")),
    ?assertEqual(true, i18n_verif:is_compliant("10")),
    ?assertEqual(true, i18n_verif:is_compliant("je   s1s ne i1i")),
    ?assertEqual(true, i18n_verif:is_compliant("m")),
    ?assertEqual(true, i18n_verif:is_compliant("1")),
    ?assertEqual(true, i18n_verif:is_compliant("1121121212522222221144455554412211111111111111556665")),
    ?assertEqual(true, i18n_verif:is_compliant("1345")),
    ?assertEqual(false, i18n_verif:is_compliant("mama")),
    ?assertEqual(false, i18n_verif:is_compliant("je suis nee ici")),
    ?assertEqual(false, i18n_verif:is_compliant("1111a111")).