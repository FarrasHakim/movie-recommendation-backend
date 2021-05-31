:- [dao/movies/filter/genre].

request_handler_filter_by_genre(Request) :-
        cors_enable,
        http_parameters(Request, [genre(Genre, [])]),
        format(user_output,"Query is: ~p~n",[Genre]),
        filter_by_genre(Genre, DictOut),
        reply_json_dict(_{list:DictOut}).