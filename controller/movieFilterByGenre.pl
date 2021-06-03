:- [dao/movies/filter/genre].

request_handler_filter_by_genre(Request) :-
        option(method(options), Request), !,
        ReqHeaders = [authorization],
        cors_enable(Request,
                        [ methods([get])
                        ]),
        format(user_output,"Request is: ~p~n",[Request]),
        format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
        reply_json_dict(_{message:"Options"}).

request_handler_filter_by_genre(Request) :-
        (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
        format(user_output,"Request is: ~p~n",[Request]),
        http_parameters(Request, [genre(Genre, [])]),
        cors_enable(Request,
                        [ methods([get])
                        ]),
        format(user_output,"Query is: ~p~n",[Genre]),
        filter_by_genre(Genre, DictOut),
        reply_json_dict(_{list:DictOut}).