:- [dao/genres/get/list].

request_handler_list_genres(Request) :-        
        cors_enable,
        format(user_output,"Request is: ~p~n",[Request]),
        list_genres(DictOut),
        reply_json_dict(_{list:DictOut}).