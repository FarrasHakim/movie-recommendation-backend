:- [dao/movies/sort/name].

sort_movies_by_name(Request) :-
    format(user_output,"Request is: ~p~n",[Request]),
    sortMoviesByName(DictOut),
    reply_json_dict(_{list:DictOut}).