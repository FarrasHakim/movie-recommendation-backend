filterMoviesRecommendation(List) :-
        findall(Movie, rating(Movie, 4.5), MovieRatings45),
        findall(Movie, rating(Movie, 4.0), MovieRatings4),
        append(MovieRatings45, MovieRatings4, Union),
        movie_list_to_detail_list(Union, List).