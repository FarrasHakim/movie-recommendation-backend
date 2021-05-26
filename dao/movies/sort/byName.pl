sortMoviesByName(List) :-
    bagof(Movie, movie(Movie, _), List).