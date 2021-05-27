:- [utils].

% Get movie by name
movieByName(Name, _{moviename: MovieName, year:OutputYear, actors: ActorsList, genres: ListGenre}) :-
    json:to_atom(Name, NameAtom),
    getMovieName(NameAtom, MovieName),
    format(user_output,"MovieName is: ~p~n",[MovieName]),
    getActors(MovieName, List),
    bagof(Year, movie(MovieName, Year), [OutputYear| _]),
    bagof(Genre, genre(MovieName, Genre), ListGenre),
    ActorsList = List.