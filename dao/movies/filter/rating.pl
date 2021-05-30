filterMoviesRecommendation(List) :-
    findall(Movie, rating(Movie, 4.5), MovieRatings45),
    findall(Movie, rating(Movie, 4.0), MovieRatings4),
    append(MovieRatings45, MovieRatings4, Union),
    movie_list_to_detail_list(Union, List).

filterMoviesByRating45(List) :-
    findall(Movie, rating(Movie, 4.5), MovieRatings),
    movie_list_to_detail_list(MovieRatings, List).

filterMoviesByRating4(List) :-
    findall(Movie, rating(Movie, 4.0), MovieRatings),
    movie_list_to_detail_list(MovieRatings, List).