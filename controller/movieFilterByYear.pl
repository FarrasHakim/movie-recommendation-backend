:- [dao/movies/filter/year].

request_handler_filter_by_year(Request) :- 
        cors_enable,
        http_parameters(Request, [year(Year, [])]),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"Query is: ~p~n",[Year]),
        filter_by_year(Year, DictOut),
   format(user_output,"DictOut is: ~p~n",[DictOut]),
        reply_json(_{list:DictOut}).