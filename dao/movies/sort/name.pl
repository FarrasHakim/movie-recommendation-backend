sortMoviesByName(List) :-
    findall(Movie, movie(Movie, _), MovieList),
    sort(MovieList, Sorted),
    movie_list_to_detail_list(Sorted, List).