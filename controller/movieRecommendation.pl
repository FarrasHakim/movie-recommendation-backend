:- [dao/movies/recommendation].
:- [utils].

request_handler_movie_recommendation(Request) :-
    cors_enable,
    %format(user_output,"Request is: ~p~n",[Request]),
    http_parameters(Request, [movie(Movie, [])]),
    filterMoviesRecommendationByMovie(Movie, MovieList),
    movie_list_to_detail_list(MovieList,MovieListDetail),
    reply_json_dict(_{list:MovieListDetail}).
