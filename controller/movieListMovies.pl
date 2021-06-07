:- [dao/movies/get/list].

request_handler_list_movies(Request) :-   
        option(method(options), Request), !,
        cors_enable(Request,
                        [ methods([get])
                        ]),
        format(user_output,"Request is: ~p~n",[Request]),
        reply_json_dict(_{message:"Options"}).

request_handler_list_movies(Request) :-   
        (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
        format(user_output,"Request is: ~p~n",[Request]),
        cors_enable(Request,
                        [ methods([get])
                        ]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).

cors_allow_headers([]) :- !.
cors_allow_headers(ReqHeaders) :-
    phrase(field_names(ReqHeaders), String),
    format('Access-Control-Allow-Headers: ~s~n', String).