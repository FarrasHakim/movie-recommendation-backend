:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_header)).
:- use_module(library(http/http_parameters)).
:- [database].
:- [utils].
:- [controller/movieFilterByName].

http:location(files, '/f', []).
http:location(food, '/food', []).

% Declare a handler, binding an HTTP path to a predicate.
% The notation root(hello_world) uses an alias-mechanism similar to
% absolute_file_name/3 and allows for moving parts of the server locations
% easily. See http_absolute_location/3.
:- http_handler(root(.), say_hi, []).

% And, just for clarity, define a second handler
% this one can by reached at http://127.0.0.1:8000/taco
:- http_handler('/movies', get_Data, []).
:- http_handler('/movies/', get_Data, []).
:- http_handler('/movies/add', add_movie, []).
:- http_handler('/movies/add/', add_movie, []).
:- http_handler('/movies/delete', delete_movie, []).
:- http_handler('/movies/delete/', delete_movie, []).
:- http_handler('/movies/filter-by-year', get_movie_by_year, []).
:- http_handler('/movies/filter-by-year/', get_movie_by_year, []).
:- http_handler('/movies/detail', get_movie_by_name, []).
:- http_handler('/movies/detail/', get_movie_by_name, []).
:- http_handler('/movies/genres/', get_genres, []).
:- http_handler('/movies/by-genre', get_movies_by_genre, []).
:- http_handler('/movies/by-genre/', get_movies_by_genre, []).
:- http_handler('/movies/sort-by-year/', sort_movies_by_year, []).
% TODO// recommended movie
% TODO// filter

% The predicate server(?Port) starts the server. It simply creates a
% number of Prolog threads and then returns to the toplevel, so you can
% (re-)load code, debug, etc.
server(Port) :-
        http_server(http_dispatch, [port(Port)]).

/* The implementation of /hello_world. The single argument provides the request
details, which we ignore for now. Our task is to write a CGI-Document:
a number of name: value -pair lines, followed by two newlines, followed
by the document content, The only obligatory header line is the
Content-type: <mime-type> header.
Printing can be done using any Prolog printing predicate, but the
format-family is the most useful. See format/2.   */

/*
Handlers
*/

say_hi(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Hello There! Farras, Sayid, Supri were here.~n').

get_movie_by_year(Request) :- 
        http_parameters(Request, [year(Year, [])]),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"Query is: ~p~n",[Year]),
        movieByYear(Year, DictOut),
   format(user_output,"DictOut is: ~p~n",[DictOut]),
        reply_json(_{list:DictOut}).

get_Data(Request) :-        
        format(user_output,"Request is: ~p~n",[Request]),
        listMovies(DictOut),
        reply_json_dict(_{list:DictOut}).

get_genres(Request) :-        
        format(user_output,"Request is: ~p~n",[Request]),
        listGenres(DictOut),
        reply_json_dict(_{list:DictOut}).

get_movies_by_genre(Request) :-
        http_parameters(Request, [genre(Genre, [])]),
        format(user_output,"Query is: ~p~n",[Genre]),
        movies_by_genre(Genre, DictOut),
        reply_json(DictOut).

sort_movies_by_year(Request) :-
        format(user_output,"Request is: ~p~n",[Request]),
        listByYear(DictOut),
        reply_json_dict(_{list:DictOut}).

add_movie(Request) :-
        http_read_json_dict(Request, Query),
        format(user_output,"Query is: ~p~n",[Query]),
        assert_movie(Query, DictOut),
        reply_json(DictOut).

delete_movie(Request) :-
        http_read_json_dict(Request, Query),
        format(user_output,"Query is: ~p~n",[Query]),
        delete_movie(Query, DictOut),
        reply_json(DictOut).

/*
Handlers Method
*/

listMovies(List) :-
        setof(Movie, Year^movie(Movie,Year),List). 
        % findall(Movie, movie(Movie, _), List).

listGenres(List) :-
        setof(Genre, Movie^genre(Movie,Genre),List).

movieByYear(Year, List) :- 
        atom_number(Year, YearNumber),
        findall(Movie, movie(Movie, YearNumber), List).

movies_by_genre(Genre, _{list:List}) :-
        json:to_atom(Genre, GenreAtom),
        findall(Movie, genre(Movie, GenreAtom), List).

listByYear(List) :-
        findall(Year-Movie, movie(Movie, Year), MovieYears),
        keysort(MovieYears, Sorted),
        findall(Year, movie(_,Year), YearList),
        msort(YearList, SortedYearList),
        pairs_values(Sorted, MovieList),
        list_to_dict_list(SortedYearList, MovieList, List).

list_to_dict_list([],[],_).
list_to_dict_list([Year],[Movie],ListDict) :-
        ListDict = [_{year:Year, movie:Movie}].
list_to_dict_list([Year|YearList], [Movie|MovieList], ListDict) :-
        list_to_dict_list(YearList, MovieList, Temp),
        append([_{year:Year, movie:Movie}], Temp, ListDict).


assert_movie(_{name:MovieName, year:MovieYear}, DictOut) :-
        assert(movie(MovieName, MovieYear)),
        DictOut = _{response:'Success'}.

delete_movie(_{name:MovieName}, DictOut) :-
        retract(movie(MovieName, _)),
        DictOut = _{response:'Delete Success'}.

