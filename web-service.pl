:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- use_module(library(http/json_convert)).
:- use_module(library(http/http_header)).
:- use_module(library(http/http_parameters)).
:- use_module(library(http/http_authenticate)).
:- use_module(library(http/http_digest)).
:- [database].
:- [utils].
:- [controller/movieFilterByName].
:- [controller/movieSortByName].
:- [controller/movieSortByRating].
:- [controller/movieRecommendation].

http:location(files, '/f', []).
http:location(food, '/food', []).

% Declare a handler, binding an HTTP path to a predicate.
% The notation root(hello_world) uses an alias-mechanism similar to
% absolute_file_name/3 and allows for moving parts of the server locations
% easily. See http_absolute_location/3.
:- http_handler(root(.), say_hi, []).

% And, just for clarity, define a second handler
% this one can by reached at http://127.0.0.1:8000/taco
:- http_handler('/movies', request_handler_list_movies, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/', request_handler_list_movies, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/recommended', request_handler_movie_recommendation, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/recommended/', request_handler_movie_recommendation, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/genres', request_handler_list_genres, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/genres/', request_handler_list_genres, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/detail', request_handler_movie_detail, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/detail/', request_handler_movie_detail, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/filter/year', request_handler_filter_by_year, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/filter/year/', request_handler_filter_by_year, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/filter/genre', request_handler_filter_by_genre, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/filter/genre/', request_handler_filter_by_genre, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/year', request_handler_sort_movies_by_year, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/year/', request_handler_sort_movies_by_year, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/name', sort_movies_by_name, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/name/', sort_movies_by_name, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/rating/asc', sort_movies_by_rating_asc, [authentication(basic(passwd, unguent_realm))]).
:- http_handler('/movies/sort/rating/asc/', sort_movies_by_rating_asc, [authentication(basic(passwd, unguent_realm))]).
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
Http Handlers
*/

say_hi(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Hello There! Farras, Sayid, Supri were here.~n').

request_handler_list_movies(Request) :-   
        format(user_output,"Request is: ~p~n",[Request]),
        list_movies(DictOut),
        reply_json_dict(_{list:DictOut}).

request_handler_list_genres(Request) :-        
        format(user_output,"Request is: ~p~n",[Request]),
        list_genres(DictOut),
        reply_json_dict(_{list:DictOut}).

request_handler_filter_by_year(Request) :- 
        http_parameters(Request, [year(Year, [])]),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"Query is: ~p~n",[Year]),
        filter_by_year(Year, DictOut),
   format(user_output,"DictOut is: ~p~n",[DictOut]),
        reply_json(_{list:DictOut}).

request_handler_filter_by_genre(Request) :-
        http_parameters(Request, [genre(Genre, [])]),
        format(user_output,"Query is: ~p~n",[Genre]),
        filter_by_genre(Genre, DictOut),
        reply_json(DictOut).

request_handler_sort_movies_by_year(Request) :-
        format(user_output,"Request is: ~p~n",[Request]),
        sort_by_year(DictOut),
        reply_json_dict(_{list:DictOut}).

/*
Handlers Method
*/

filter_by_year(Year, MovieDetailList) :- 
        atom_number(Year, YearNumber),
        findall(Movie, movie(Movie, YearNumber), MovieList),
        movie_list_to_detail_list(MovieList, MovieDetailList).

filter_by_genre(Genre, _{list:MovieDetailList}) :-
        json:to_atom(Genre, GenreAtom),
        findall(Movie, genre(Movie, GenreAtom), MovieList),        
        movie_list_to_detail_list(MovieList, MovieDetailList).

sort_by_year(MovieListDetail) :-
        findall(Year-Movie, movie(Movie, Year), MovieYears),
        keysort(MovieYears, Sorted),
        pairs_values(Sorted, MovieList),
        movie_list_to_detail_list(MovieList, MovieListDetail).

list_genres(List) :-
        setof(Genre, Movie^genre(Movie,Genre),List).

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
