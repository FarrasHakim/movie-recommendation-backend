:- [dao/genres/get/list].

request_handler_list_genres(Request) :-        
        option(method(options), Request), !,
        ReqHeaders = [authorization],
        cors_enable(Request,
                        [ methods([get])
                        ]),
        format(user_output,"Request is: ~p~n",[Request]),
        format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
        reply_json_dict(_{message:"Options"}).

request_handler_list_genres(Request) :-       
        (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
        format(user_output,"Request is: ~p~n",[Request]), 
        cors_enable(Request,
                        [ methods([get])
                        ]),
        list_genres(DictOut),
        reply_json_dict(_{list:DictOut}).