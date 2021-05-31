sort_by_year(MovieListDetail) :-
    findall(Year-Movie, movie(Movie, Year), MovieYears),
    keysort(MovieYears, Sorted),
    pairs_values(Sorted, MovieList),
    movie_list_to_detail_list(MovieList, MovieListDetail).