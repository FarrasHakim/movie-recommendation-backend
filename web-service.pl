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
:- set_setting(http:cors, ['http://localhost:8080']).


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


:- http_handler(root(.), homes, [prefix]).
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
:- http_handler('/movies/sort/year', request_handler_sort_movies_by_year, []).
:- http_handler('/movies/sort/year/', request_handler_sort_movies_by_year, []).
:- http_handler('/movies/sort/name', sort_movies_by_name, []).
:- http_handler('/movies/sort/name/', sort_movies_by_name, []).
:- http_handler('/movies/sort/rating/asc', sort_movies_by_rating_asc, []).
:- http_handler('/movies/sort/rating/asc/', sort_movies_by_rating_asc, []).

http:location(public, root(public), []).
user:file_search_path(homes, library('templates')).

homes(Request) :-
        http_reply_from_files('./templates', [], Request).

homes(_Request) :-
        serve_files_in_directory(homes).

server(Port) :-
        http_server(http_dispatch, [port(Port)]).
