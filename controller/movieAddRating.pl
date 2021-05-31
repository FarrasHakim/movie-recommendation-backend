:- [utils].

request_handler_add_rating(Request) :-
    cors_enable,
    http_parameters(Request, [user(User, []), movie(Movie, []), rating(Rating, [])]),
    json:to_atom(User, UserAtom),
    json:to_atom(Movie, MovieAtom),
    add_rating(UserAtom, MovieAtom, Rating),
    reply_json_dict(_{message:"Success"}).
    