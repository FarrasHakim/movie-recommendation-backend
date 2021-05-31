filter_by_genre(Genre, _{list:MovieDetailList}) :-
    json:to_atom(Genre, GenreAtom),
    findall(Movie, genre(Movie, GenreAtom), MovieList),        
    movie_list_to_detail_list(MovieList, MovieDetailList).