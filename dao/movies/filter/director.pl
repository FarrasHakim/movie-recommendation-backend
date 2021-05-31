filterMoviesByDirector(Director, List) :-
    findall(Movie, director(Movie, Director), List).
