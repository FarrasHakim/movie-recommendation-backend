request_handler_sort_movies_by_year(Request) :-
        cors_enable(Request,
                  [ methods([get, post, delete])]),
        format(user_output,"Request is: ~p~n",[Request]),
        sort_by_year(DictOut),
        reply_json_dict(_{list:DictOut}).