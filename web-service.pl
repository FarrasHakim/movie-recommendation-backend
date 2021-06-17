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
:- use_module(library(http/http_cors)).
:- use_module(library(http/http_files)).
:- use_module(library(http/http_server_files)).
:- use_module(library(http/http_client)).
:- set_setting(http:cors, ['*']).


:- [database].
:- [utils].

:- [controller/movieListMovies].
:- [controller/movieListGenre].
:- [controller/movieGetByName].
:- [controller/movieFilterByGenre].
:- [controller/movieFilterByYear].
:- [controller/movieSortByName].
:- [controller/movieSortByRating].
:- [controller/movieSortByYear].
:- [controller/movieRecommendation].
:- [controller/movieAddRating].

:- http_handler(root(.), homes, []).
:- http_handler('/movies', request_handler_list_movies, []).
:- http_handler('/movies/', request_handler_list_movies, []).
:- http_handler('/movies/recommended', request_handler_movie_recommendation, []).
:- http_handler('/movies/recommended/', request_handler_movie_recommendation, []).
:- http_handler('/movies/genres', request_handler_list_genres, []).
:- http_handler('/movies/genres/', request_handler_list_genres, []).
:- http_handler('/movies/detail', request_handler_movie_detail, []).
:- http_handler('/movies/detail/', request_handler_movie_detail, []).
:- http_handler('/movies/filter/year', request_handler_filter_by_year, []).
:- http_handler('/movies/filter/year/', request_handler_filter_by_year, []).
:- http_handler('/movies/filter/genre', request_handler_filter_by_genre, []).
:- http_handler('/movies/filter/genre/', request_handler_filter_by_genre, []).
:- http_handler('/movies/sort/year/asc', request_handler_sort_movies_by_year, []).
:- http_handler('/movies/sort/year/asc/', request_handler_sort_movies_by_year, []).
:- http_handler('/movies/sort/name/asc', sort_movies_by_name, []).
:- http_handler('/movies/sort/name/asc/', sort_movies_by_name, []).
:- http_handler('/movies/sort/rating/asc', sort_movies_by_rating_asc, []).
:- http_handler('/movies/sort/rating/asc/', sort_movies_by_rating_asc, []).
:- http_handler('/movies/add_rating', request_handler_add_rating, []).
:- http_handler('/movies/add_rating/', request_handler_add_rating, []).
:- http_handler('/users/register', request_handler_register_user, []).
:- http_handler('/users/register/', request_handler_register_user, []).

homes(_Request) :-
        format('Content-type: text/plain~n~n'),
        format('Hello There! Farras, Sayid, Supri were here.~n').

server(Port) :-
        addAverageRating,
        http_server(http_dispatch, [port(Port)]).

request_handler_register_user(Request) :-
        option(method(options), Request), !,
        cors_enable(Request,
                        [ methods([post])
                        ]),
        reply_json_dict(_{message:"Options"}).
        
request_handler_register_user(Request) :-
        http_read_json_dict(Request, Data),
        cors_enable(Request,
                [ methods([post])
        ]),
        Data = _{username:Username, password:Password},
        add_uname_pw(Username, Password),
        reply_json_dict(_{code:200,message:"Success"}).