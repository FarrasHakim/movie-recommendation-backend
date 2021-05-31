sortMoviesByRatingAsc(List) :-
    addAverageRating,
    findall(Rating-Movie, rating(Movie, Rating), MovieRatings),
    keysort(MovieRatings, Sorted),
    pairs_values(Sorted, MovieList),
    movie_list_to_detail_list(MovieList, List).