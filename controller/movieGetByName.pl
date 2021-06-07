:- [dao/movies/get/name].

request_handler_movie_detail(Request) :- 
    option(method(options), Request), !,
    cors_enable(Request,
                    [ methods([get])
                    ]),
    format(user_output,"Request is: ~p~n",[Request]),
    reply_json_dict(_{message:"Options"}).

request_handler_movie_detail(Request) :-    
    (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
    format(user_output,"Request is: ~p~n",[Request]),
    http_parameters(Request, [name(Name, [])]),
    cors_enable(Request,
                    [ methods([get])
                    ]),
    format(user_output,"Query is: ~p~n",[Name]),
    movie_detail(Name, DictOut),
    reply_json(DictOut).