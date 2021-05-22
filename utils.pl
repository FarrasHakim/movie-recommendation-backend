getMovieName(NameAtom, MovieName) :-
    listMovies(Movies),
    getMovieName(Movies, NameAtom, MovieName).
getMovieName([X|_], Subname, X) :-
    sub_atom(X, _, _, _, Subname).
getMovieName([_|Xt], Subname, X) :-
    getMovieName(Xt, Subname, X).

getActors(Movie, List) :-
    findall(Actor, actor(Movie, Actor, _);actress(Movie, Actor, _), List).