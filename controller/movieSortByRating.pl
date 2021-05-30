:- [dao/movies/sort/rating].

sort_movies_by_rating_asc(Request) :-
    format(user_output,"Request is: ~p~n",[Request]),
    sortMoviesByRatingAsc(DictOut),
    reply_json_dict(_{list:DictOut}).