:- [dao/movies/filter/rating].

request_handler_movie_recommendation(Request) :-
    format(user_output,"Request is: ~p~n",[Request]),
    filterMoviesRecommendation(DictOut),
    reply_json_dict(_{list:DictOut}).