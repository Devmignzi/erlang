-module (premier).
-export([remove_multiple_by_two/1,remove_multiple_by_three/1,remove_multiple_by_five/1,remove_multiples/1,eratosthenes/1]).

remove_multiple_by_two(N)->remove_multiple_by_two(N,[]).


remove_multiple_by_two([], Without_paire) ->
    io:format("liste finale vaut ~p~n", [Without_paire]),
    Without_paire;

remove_multiple_by_two([H|T],Without_paire)->
    case H rem 2 of
        0 -> 
            remove_multiple_by_two(T,Without_paire);
        _ ->  
            remove_multiple_by_two(T,[H|Without_paire])
    end.

remove_multiple_by_three(N)->
    remove_multiple_by_three(N,[]).

remove_multiple_by_three([], Without_impaire) ->
    Without_impaire;

remove_multiple_by_three([H|T],Without_impaire)->
    case H rem 3 of
        0 -> 
            remove_multiple_by_three(T,Without_impaire);
        _ ->  
            remove_multiple_by_three(T,[H|Without_impaire])
    end.

remove_multiple_by_five(N)->
    remove_multiple_by_five(N,[]).  

remove_multiple_by_five([], Without_five) ->
    Without_five;

remove_multiple_by_five([H|T],Without_five)->
    case H rem 5 of
        0 -> 
            remove_multiple_by_five(T,Without_five);
        _ ->  
            remove_multiple_by_five(T,[H|Without_five])
    end.
      
remove_multiples(List) ->
    List1 = remove_multiple_by_two(List),
    List2 = remove_multiple_by_three(List1),
    List3 = remove_multiple_by_five(List2),
    io:format("liste finale sans les multiples de 2, 3 et 5 vaut ~p~n", [List3]),
    List3.

% je genrealise au lieu de remove par des nombres precis je remove par N

%% Fonction principale pour obtenir tous les nombres premiers jusqu'à N
eratosthenes(N) ->
    %% Crée une liste des nombres de 2 à N
    Numbers = lists:seq(2, N),
    %% Applique Ératosthène
    final_list(Numbers, []).

%% Fonction pour appliquer le crible d'Ératosthène
final_list([], Primes) ->
    lists:reverse(Primes);
final_list([H | T], Primes) ->
    %% Supprime les multiples de H
    ListWithoutMultiples = remove_multiples_of(H, T),
    %% Ajoute H à la liste des nombres premiers et appelle final_list récursivement
    final_list(ListWithoutMultiples, [H | Primes]).

%% Fonction pour supprimer les multiples d'un nombre donné
remove_multiples_of(_, []) ->
    [];
remove_multiples_of(N, [H | T]) ->
    case H rem N of
        0 -> remove_multiples_of(N, T); %% H est un multiple de N, l'ignore
        _ -> [H | remove_multiples_of(N, T)] %% H n'est pas un multiple de N
    end.
