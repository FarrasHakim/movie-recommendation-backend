:- [dao/movies/filter/year].

request_handler_filter_by_year(Request) :-         
     option(method(options), Request), !,
     ReqHeaders = [authorization],
     cors_enable(Request,
                    [ methods([get])
                    ]),
     format(user_output,"Request is: ~p~n",[Request]),
     format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
     reply_json_dict(_{message:"Options"}).

request_handler_filter_by_year(Request) :- 
     (   http_authenticate(basic(passwd), Request, _Fields)
     ->  true
     ;   throw(http_reply(authorise(basic, harbinger_realm)))
     ),
     format(user_output,"Request is: ~p~n",[Request]),
     http_parameters(Request, [year(Year, [])]),
     cors_enable(Request,
                    [ methods([get])
               ]),
     format(user_output,"Query is: ~p~n",[Year]),
     format(user_output,"Request is: ~p~n",[Request]),
     format(user_output,"Query is: ~p~n",[Year]),
     filter_by_year(Year, DictOut),
     format(user_output,"DictOut is: ~p~n",[DictOut]),
     reply_json(_{list:DictOut}).