:- [dao/movies/sort/name].

sort_movies_by_name(Request) :-
    option(method(options), Request), !,
    cors_enable(Request,
            [ methods([get])
    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    reply_json_dict(_{message:"Options"}).

sort_movies_by_name(Request) :-
    (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
    cors_enable(Request,
                    [ methods([get])
    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    sortMoviesByName(DictOut),
    reply_json_dict(_{list:DictOut}).