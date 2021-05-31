:- [dao/movies/get/list].

request_handler_list_movies(Request) :-   
        cors_enable,
        format(user_output,"Request is: ~p~n",[Request]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).