list_movies(MovieDetailList) :-
    findall(Movie, movie(Movie, _), MovieList),
    movie_list_to_detail_list(MovieList, MovieDetailList).