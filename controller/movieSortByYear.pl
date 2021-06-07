:- [dao/movies/sort/year].

request_handler_sort_movies_by_year(Request) :-
        option(method(options), Request), !,
        cors_enable(Request,
                        [ methods([get])
                        ]),
        format(user_output,"Request is: ~p~n",[Request]),
        reply_json_dict(_{message:"Options"}).        

request_handler_sort_movies_by_year(Request) :- 
        (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
        format(user_output,"Request is: ~p~n",[Request]), 
        cors_enable(Request,
                        [ methods([get])
                        ]),
        sort_by_year(DictOut),
        reply_json_dict(_{list:DictOut}).