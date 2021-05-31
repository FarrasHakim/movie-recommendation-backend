:- [utils].

% Get movie by name
movie_detail(Name, _{movie: MovieName, year:OutputYear, actors: ActorsList, genres: ListGenre, poster: Poster, desc: Description}) :-
    json:to_atom(Name, NameAtom),
    getMovieName(NameAtom, MovieName),
    format(user_output,"MovieName is: ~p~n",[MovieName]),
    list_actors(MovieName, List),
    bagof(Year, movie(MovieName, Year), [OutputYear| _]),
    bagof(Genre, genre(MovieName, Genre), ListGenre),
    bagof(Poster, poster(MovieName, Poster), [Poster|_]),
    bagof(Description, description(MovieName, Description), [Description|_]),
    ActorsList = List.