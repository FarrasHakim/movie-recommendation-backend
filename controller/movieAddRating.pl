:- [utils].

request_handler_add_rating(Request) :-
    option(method(options), Request), !,
        ReqHeaders = [authorization, content_type],
        cors_enable(Request,
                        [ methods([post])
                        ]),
        format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).

request_handler_add_rating(Request) :-
    format(user_output,"Request is: ~p~n",[Request]),
    (   http_authenticate(basic(passwd), Request, _Fields)
	->  true
	;   throw(http_reply(authorise(basic, harbinger_realm)))
	),
    http_read_json_dict(Request, Data),
    cors_enable(Request,
                        [ methods([post])
                        ]),
    format(user_output,"Request is: ~p~n",[Request]),
    format(user_output,"Data is: ~p~n",[Data]),
    Data = _{user:User, movie:Movie, rating:Rating},
    json:to_atom(User, UserAtom),
    json:to_atom(Movie, MovieAtom),
    atom_number(Rating, RatingNumber),
    add_rating(UserAtom, MovieAtom, RatingNumber),
    reply_json_dict(_{message:"Success"}).
    