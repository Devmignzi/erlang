-module(sort).
-export([sort/1]).

% trie la liste
sort(Liste) -> 
    bubble_sort(Liste, length(Liste)).


bubble_sort(Liste, 0) ->
    Liste;  % Si la longueur est 0, la liste est triée
bubble_sort(Liste, N) ->

    {NouvelleListe, Echange} = comparevoisin(Liste),
   
    if
        Echange -> bubble_sort(NouvelleListe, N - 1);
        true -> NouvelleListe
    end.

comparevoisin([Ech1, Ech2 | RestListe]) when Ech1 > Ech2 ->
    % Si Ech1 > Ech2, on échange Ech1 et Ech2, on continue la passe
    {RestListeTriee, Echange} = comparevoisin([Ech1 | RestListe]),
    {[Ech2 | RestListeTriee], true};

comparevoisin([Ech1, Ech2 | RestListe]) ->
    % Si Ech1 <= Ech2, pas besoin d'échanger, on continue
    {RestListeTriee, Echange} = comparevoisin([Ech2 | RestListe]),
    {[Ech1 | RestListeTriee], Echange};
comparevoisin([Ech]) ->
    {[Ech], false};  % Fin de la liste
comparevoisin([]) ->
    {[], false}.  % Liste vide, on ne fait rien 
