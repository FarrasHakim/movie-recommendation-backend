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

% Change list to dict of list
list_to_dict_list([],[],_).
list_to_dict_list([Year],[Movie],ListDict) :-
        % list_actors(Movie, ActorsList),
        findall(Genre, genre(Movie, Genre), GenresList),
        findall(Director, director(Movie, Director), [Director|_]),
        findall(Desc,description(Movie,Desc),[Desc|_]),
        findall(PosterUrl,poster(Movie,PosterUrl),[PosterUrl|_]),
        findall(Rating, rating(Movie, Rating), [Rating|_]),
        ListDict = [_{
                year:Year, 
                movie:Movie, 
                % actors: ActorsList, 
                director: Director, 
                genres: GenresList,
                desc: Desc,
                poster: PosterUrl,
                rating: Rating
                }].

list_to_dict_list([Year|YearList], [Movie|MovieList], ListDict) :-
        list_to_dict_list(YearList, MovieList, Temp),
        % list_actors(Movie, ActorsList),
        findall(Genre, genre(Movie, Genre), GenresList),
        findall(Director, director(Movie, Director), [Director|_]),
        findall(Desc,description(Movie,Desc),[Desc|_]),
        findall(PosterUrl,poster(Movie,PosterUrl),[PosterUrl|_]),
        findall(Rating, rating(Movie, Rating), [Rating|_]),
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

% Change movie list to list of movies with details
movie_list_to_detail_list([], _).
movie_list_to_detail_list([Movie], ListDict) :-
        % list_actors(Movie, ActorsList),
        findall(Genre, genre(Movie, Genre), GenresList),
        findall(Director, director(Movie, Director), [Director|_]),
        findall(Year,movie(Movie,Year),[Year|_]),
        findall(Desc,description(Movie,Desc),[Desc|_]),
        findall(PosterUrl,poster(Movie,PosterUrl),[PosterUrl|_]),
        findall(Rating, rating(Movie, Rating), [Rating|_]),
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
        findall(Rating, rating(Movie, Rating), [Rating|_]),
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
