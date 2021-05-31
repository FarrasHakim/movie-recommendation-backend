:- [dao/movies/filter/name].

request_handler_movie_detail(Request) :- 
    cors_enable,
    http_parameters(Request, [name(Name, [])]),
    format(user_output,"Query is: ~p~n",[Name]),
    movie_detail(Name, DictOut),
    reply_json(DictOut).