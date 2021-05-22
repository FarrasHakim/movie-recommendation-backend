getMovieName(NameAtom, MovieName) :-
    listMovies(Movies),
    getMovieName(Movies, NameAtom, MovieName).

getMovieName([X|_], Subname, X) :-
    sub_atom(X, _, _, _, Subname).
getMovieName([_|Xt], Subname, X) :-
    getMovieName(Xt, Subname, X).