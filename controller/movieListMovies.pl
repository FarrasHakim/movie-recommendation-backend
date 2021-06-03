:- [dao/movies/get/list].

request_handler_list_movies(Request) :-   
        option(method(options), Request), !,
        ReqHeaders = [authorization],
        cors_enable(Request,
                        [ methods([get,post,delete])
                        ]),
        format(user_output,"Request is: ~p~n",[Request]),
        format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).

request_handler_list_movies(Request) :-   
        (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
        format(user_output,"Request is: ~p~n",[Request]),
        cors_enable(Request,
                        [ methods([get,post,delete])
                        ]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).

cors_allow_headers([]) :- !.
cors_allow_headers(ReqHeaders) :-
    phrase(field_names(ReqHeaders), String),
    format('Access-Control-Allow-Headers: ~s~n', String).