:- [dao/movies/filter/name].

get_movie_by_name(Request) :- 
    http_parameters(Request, [name(Name, [])]),
    format(user_output,"Query is: ~p~n",[Name]),
    movieByName(Name, DictOut),
    reply_json(DictOut).