
% Get movie name from subatom
getMovieName(NameAtom, MovieName) :-
    listMovies(Movies),
    getMovieName(Movies, NameAtom, MovieName).
getMovieName([X|_], Subname, X) :-
    sub_atom(X, _, _, _, Subname).
getMovieName([_|Xt], Subname, X) :-
    getMovieName(Xt, Subname, X).

% Get list of movie names
listMovies(List) :-
        findall(Movie, movie(Movie, _), List).

% Get list of genre
listGenres(List) :-
        setof(Genre, Movie^genre(Movie,Genre),List).
        
% Get list of actors and actress
getActors(Movie, List) :-
    findall(Actor, actor(Movie, Actor, _);actress(Movie, Actor, _), List).

% Change list to dict of list
list_to_dict_list([],[],_).
list_to_dict_list([Year],[Movie],ListDict) :-
        ListDict = [_{year:Year, movie:Movie}].
list_to_dict_list([Year|YearList], [Movie|MovieList], ListDict) :-
        list_to_dict_list(YearList, MovieList, Temp),
        append([_{year:Year, movie:Movie}], Temp, ListDict).