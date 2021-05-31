filter_by_genre(Genre, MovieDetailList) :-
    json:to_atom(Genre, GenreAtom),
    findall(Movie, genre(Movie, GenreAtom), MovieList),        
    movie_list_to_detail_list(MovieList, MovieDetailList).

filter_by_genre_list(Genre, MovieList) :-
    json:to_atom(Genre, GenreAtom),
    findall(Movie, genre(Movie, GenreAtom), MovieList).       
    