% Get movie name from subatom
getMovieName(NameAtom, MovieName) :-
        findall(Movie, movie(Movie, _), Movies),
        matchStringFromList(Movies, NameAtom, MovieName).

% Get match string from list.
matchStringFromList([X|_], Subname, X) :-
        sub_atom(X, _, _, _, Subname).
matchStringFromList([_|Xt], Subname, X) :-
        matchStringFromList(Xt, Subname, X).

% To add Username and Password to use in basic authentication
add_uname_pw(Uname, PW) :-
	http_read_passwd_file(passwd, Users),
	crypt(PW, Hash),
	atom_codes(AHash, Hash),
	http_write_passwd_file(passwd, [passwd(Uname, AHash, []) | Users]).

% start the passwd file with user adminuser password adminpw
start_pw_file :-
	crypt(admin, Hash),
	atom_codes(AHash, Hash),
	http_write_passwd_file(passwd, [passwd(admin, AHash, [])]).
        
% Change movie list to list of movies with details
movie_list_to_detail_list([], _).
movie_list_to_detail_list([Movie], ListDict) :-
        % list_actors(Movie, ActorsList),
        findall(Genre, genre(Movie, Genre), GenresList),
        findall(Director, director(Movie, Director), [Director|_]),
        findall(Year,movie(Movie,Year),[Year|_]),
        findall(Desc,description(Movie,Desc),[Desc|_]),
        findall(PosterUrl,poster(Movie,PosterUrl),[PosterUrl|_]),
        average_rating(Movie, Rating),
        ListDict = [_{
                year:Year, 
                movie:Movie, 
                % actors: ActorsList, 
                director: Director, 
                genres: GenresList,                
                desc: Desc,
                poster: PosterUrl,
                rating: Rating}].

movie_list_to_detail_list([Movie|MovieList], ListDict) :-
        movie_list_to_detail_list(MovieList, Temp),
        % list_actors(Movie, ActorsList),
        findall(Genre, genre(Movie, Genre), GenresList),
        findall(Director, director(Movie, Director), [Director|_]),
        findall(Year,movie(Movie,Year),[Year|_]),
        findall(Desc,description(Movie,Desc),[Desc|_]),
        findall(PosterUrl,poster(Movie,PosterUrl),[PosterUrl|_]),
        average_rating(Movie, Rating),
        append([_{
                year:Year, 
                movie:Movie, 
                % actors: ActorsList, 
                director: Director, 
                genres: GenresList,
                desc: Desc,
                poster: PosterUrl,
                rating: Rating
                }], 
                Temp, 
                ListDict).

average_rating(Movie, RatingAverage) :-
        findall(Rating, user_rating(_, Movie, Rating), ListRating),
        average(ListRating, RatingAverage).

truncate(X,N,Result):- X >= 0, Result is floor(10^N*X)/10^N, !.
truncate(X,N,Result):- X <0, Result is ceil(10^N*X)/10^N, !. 

average([], 0).
average(List, Average):- 
        list_sum(List, Sum),
        length(List, Length),
        Length > 0, 
        AverageT is Sum / Length, truncate(AverageT, 1, Average).

list_sum([Item], Item).
list_sum([Item1,Item2 | Tail], Total) :-
        Sum is Item1 + Item2,
        list_sum([Sum|Tail], Total).

add_rating(User, Movie, Rate) :-
    retract(user_rating(User, Movie, _)),
    !,
    assert(user_rating(User, Movie, Rate)).

add_rating(User, Movie, Rate) :-
    assert(user_rating(User, Movie, Rate)).