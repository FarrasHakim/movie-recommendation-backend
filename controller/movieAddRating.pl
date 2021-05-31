:- [utils].

request_handler_add_rating(Request) :-
    cors_enable,
    format(user_output,"Request is: ~p~n",[Request]),
    http_read_json_dict(Request, Query),
    Query = _{user:User,movie:Movie,rating:Rating},
    json:to_atom(User, UserAtom),
    json:to_atom(Movie, MovieAtom),
    add_rating(UserAtom, MovieAtom, Rating),
    reply_json_dict(_{message:"Success"}).
    