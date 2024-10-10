-module(trisimple).
-export([sort/1]).

% Fonction principale pour trier la liste
sort(Liste) -> 
    simple_sort(Liste).

simple_sort(Liste) ->
    NouvelleListe = comparevoisin(Liste),
    % Si la liste reste inchangée après une passe, elle est triée
    if
        Liste =:= NouvelleListe -> Liste;
        true -> simple_sort(NouvelleListe)
    end.

% Comparer les voisins dans la liste
comparevoisin([Ech1, Ech2 | RestListe]) when Ech1 > Ech2 ->
    % Si Ech1 > Ech2, on échange Ech1 et Ech2, on continue la passe
    [Ech2 | comparevoisin([Ech1 | RestListe])];
comparevoisin([Ech1, Ech2 | RestListe]) ->
    % Si Ech1 <= Ech2, pas besoin d'échanger, on continue
    [Ech1 | comparevoisin([Ech2 | RestListe])];
comparevoisin([Ech]) ->
    [Ech];  % Fin de la liste
comparevoisin([]) ->
    [].  % Liste vide
