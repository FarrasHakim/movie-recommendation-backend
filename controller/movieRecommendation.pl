:- [dao/movies/recommendation].

request_handler_movie_recommendation(Request) :-
    cors_enable,
    format(user_output,"Request is: ~p~n",[Request]),
    filterMoviesRecommendation(DictOut),
    reply_json_dict(_{list:DictOut}).