:- use_module(library(http/thread_httpd)).
:- use_module(library(http/http_dispatch)).
:- use_module(library(http/http_error)).
:- use_module(library(http/http_json)).
:- use_module(library(http/json)).
:- use_module(library(http/http_header)).
:- [database].

http:location(files, '/f', []).
http:location(food, '/food', []).

% Declare a handler, binding an HTTP path to a predicate.
% The notation root(hello_world) uses an alias-mechanism similar to
% absolute_file_name/3 and allows for moving parts of the server locations
% easily. See http_absolute_location/3.
:- http_handler(root(.), say_hi, []).

% And, just for clarity, define a second handler
% this one can by reached at http://127.0.0.1:8000/taco
:- http_handler(food(tacos), say_taco, []).
:- http_handler(food(kebabs), say_kebab, []).
:- http_handler('/add/', handle_request, []).
:- http_handler('/movies/', get_Data, []).
:- http_handler('/test-json/', handle_json_request, []).
:- http_handler('/movies/filter-by-year/', get_movie_by_year, []).
:- http_handler('/movies/by-name/', get_movie_by_name, []).
% TODO// recommended movie
% TODO// weekly movie
% TODO// filter
% TODO// genre

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
        format('Hello There! Farras was here.~n').

say_taco(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Tacos are yummie!~n').

say_kebab(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Kebabs are quote and quote healthy!~n').

handle_request(Request) :-
        http_read_json_dict(Request, Query),
        solve(Query, Solution),
        reply_json_dict(Solution).

handle_json_request(Request) :-
   format(user_output,"I'm here~n",[]),
   http_read_json(Request, DictIn,[json_object(term)]),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"DictIn is: ~p~n",[DictIn]),
   DictOut=DictIn,
   reply_json(DictOut).

get_movie_by_year(Request) :- 
        http_read_json_dict(Request, Query),
   format(user_output,"Request is: ~p~n",[Request]),
   format(user_output,"Query is: ~p~n",[Query]),
        movieByYear(Query, DictOut),
   format(user_output,"DictOut is: ~p~n",[DictOut]),
        reply_json(_{list:DictOut}).

/*
Handlers Method
*/

get_Data(Request) :-        
        format(user_output,"Request is: ~p~n",[Request]),
        http_read_request(Fdln, Request),
        format(user_output,"Request is: ~p~n",[Fdln]),
        listMovies(DictOut),
        reply_json_dict(_{list:DictOut}).

get_movie_by_name(Request) :- 
        http_read_json_dict(Request, Query),
        format(user_output,"Query is: ~p~n",[Query]),
        format(user_output,"Query is: ~p~n",[Query.name]),
        movieByName(Query, DictOut),
        reply_json(DictOut).

solve(_{a:X, b:Y}, Dict) :-
    number(X),
    number(Y),
    N is X + Y,
    Dict = _{sum: N}.

listMovies(List) :-
        findall(Movie, movie(Movie, _), List).

movieByYear(_{year:Year}, List) :- 
        findall(Movie, movie(Movie, Year), List).

movieByName(_{name:Name}, _{moviename: Name, year:OutputYear, actors: ActorsList}) :-
        format(user_output,"ActorInput is: ~p~n",[Name]),
        json:to_atom(Name, NameAtom),
        getActors(NameAtom, List),
        bagof(Year, movie(NameAtom, Year), [OutputYear| _]),
        ActorsList = List.
        
getActors(Movie, List) :-
        findall(Actor, actor(Movie, Actor, _);actress(Movie, Actor, _), List).

