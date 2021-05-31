filterMoviesByRating(Rating, List) :-
    findall(Movie, rating(Movie, Rating), MovieRatings),
    movie_list_to_detail_list(MovieRatings, List).
