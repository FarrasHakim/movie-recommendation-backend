:- [utils].

request_handler_add_rating(Request) :-
    option(method(options), Request), !,
        ReqHeaders = [authorization, content_type],
        cors_enable(Request,
                        [ methods([post])
                        ]),
        format(user_output,"ReqHeader is: ~p~n",[ReqHeaders]),
        reply_json_dict(_{message:"Options"}).

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
    to_number(Rating, RatingAtom),
    add_rating(UserAtom, MovieAtom, RatingAtom),
    reply_json_dict(_{code:200,message:"Success"}).
    
to_number(Rating, RatingAtom) :- string(Rating), atom_number(Rating, RatingAtom), !.
to_number(Rating, RatingAtom) :- RatingAtom = Rating.