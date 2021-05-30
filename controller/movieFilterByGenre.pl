request_handler_filter_by_genre(Request) :-
        cors_enable(Request,
                  [ methods([get, post, delete])]),
        http_parameters(Request, [genre(Genre, [])]),
        format(user_output,"Query is: ~p~n",[Genre]),
        filter_by_genre(Genre, DictOut),
        reply_json(DictOut).