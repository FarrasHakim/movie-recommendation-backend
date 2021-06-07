:- [dao/movies/recommendation].
:- [utils].

request_handler_movie_recommendation(Request) :-
    option(method(options), Request), !,
    cors_enable(Request,
                    [ methods([get])
    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    reply_json_dict(_{message:"Options"}).

request_handler_movie_recommendation(Request) :-
    (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
    format(user_output,"Request is: ~p~n",[Request]),
    http_parameters(Request, [movie(Movie, [])]),
    cors_enable(Request,
                    [ methods([get])
    ]),
    filterMoviesRecommendationByMovie(Movie, MovieList),
    movie_list_to_detail_list(MovieList,MovieListDetail),
    reply_json_dict(_{list:MovieListDetail}).
