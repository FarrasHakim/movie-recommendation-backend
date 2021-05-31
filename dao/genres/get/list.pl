list_genres(List) :-
    setof(Genre, Movie^genre(Movie,Genre),List).