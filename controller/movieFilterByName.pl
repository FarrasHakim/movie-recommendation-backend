:- [dao/movies/filter/name].

http_handler_movie_detail(Request) :- 
    http_parameters(Request, [name(Name, [])]),
    format(user_output,"Query is: ~p~n",[Name]),
    movieByName(Name, DictOut),
    reply_json(DictOut).