-module(i18n_verif).
-export([is_compliant/1]).

% Point d'entrée principal
is_compliant(N) ->
    is_compliant(N, 0, none, false, false).

% Cas de base : fin de liste
is_compliant([], ConsecutiveCount, PrevType, InWord, LastCharIsNumber) ->
    % Vérifie à la fin si un mot se termine encore en cours
    if
        InWord ->
            % Si un mot est en cours, vérifier les conditions finales
            if
                ConsecutiveCount > 2 ->
                    io:format("Mot final avec trop de lettres consécutives~n"),
                    false;
                LastCharIsNumber ->
                    io:format("Mot se termine par un chiffre~n"),
                    false;
                true ->
                    true
            end;
        true ->
            true
    end;

% Cas des lettres
is_compliant([H|T], ConsecutiveCount, PrevType, InWord, LastCharIsNumber) when H >= $a, H =< $z ->
    io:format("Lettre en cours: ~c~n", [H]),
    if
        ConsecutiveCount =:= 2 andalso InWord ->
            % Trois lettres consécutives trouvées dans un mot, retourner false
            io:format("Trois lettres consécutives trouvées dans un mot~n"),
            false;

        PrevType =:= letter ->
            % Lettre précédente est une lettre, incrémenter le compteur
            is_compliant(T, ConsecutiveCount + 1, letter, InWord, false);

        true ->
            % Réinitialiser le compteur et continuer si le caractère précédent n'était pas une lettre
            is_compliant(T, 1, letter, true, false)
    end;

% Cas des chiffres
is_compliant([H|T], _, _, InWord, _) when H >= $0, H =< $9 ->
    io:format("Nombre en cours: ~c~n", [H]),
    % Ignore les chiffres pour les vérifications de suite consécutives
    is_compliant(T, 0, number, InWord, true);

% Cas des espaces
is_compliant([H|T], ConsecutiveCount, PrevType, InWord, _) when H =:= 32 ->
    io:format("Espace détecté~n"),
    case InWord of
        true ->
            % Vérifie si un mot se termine avec trop de lettres consécutives ou si un chiffre termine le mot
            if
                ConsecutiveCount > 2 ->
                    io:format("Mot avec trop de lettres consécutives~n"),
                    false;
                true ->
                    % Réinitialiser le compteur et les types si un espace est trouvé
                    is_compliant(T, 0, none, false, false)
            end;
        false ->
            % Continuer sans réinitialiser si un espace est trouvé mais pas de mot en cours
            is_compliant(T, 0, none, false, false)
    end;

% Cas de transition entre caractères non traités
is_compliant([_|T], _, _, _, _) ->
    is_compliant(T, 0, none, false,false).
