:- [dao/movies/recommendation].

request_handler_movie_recommendation(Request) :-
    cors_enable,
    format(user_output,"Request is: ~p~n",[Request]),
    http_parameters(Request, [movie(Movie, [])]),
    filterMoviesRecommendationByMovie(Movie, MovieList),
    reply_json_dict(_{list:MovieList}).
