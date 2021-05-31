:- use_module(library(ordsets)).

:- [filter/director].
:- [filter/genre].
:- [sort/rating].

filterMoviesRecommendationByMovie(Movie, MovieList):-
    director(Movie, Director),
    findall(Genre, genre(Movie, Genre), GenreList),        
    getMoviesByGenres(GenreList, MoviesByGenres),
    sort_movies_by_rating(MoviesByGenres, GenreByRating),
    movie_list_to_detail_list(GenreByRating, GenreByRatingDetail),
    filterMoviesByDirector(Director, MoviesByDirector),
    sort_movies_by_rating(MoviesByDirector, DirectorByRating),
    movie_list_to_detail_list(DirectorByRating, DirectorByRatingDetail),
    ord_union(GenreByRatingDetail, DirectorByRatingDetail, ReversedMovieList),
    reverse(ReversedMovieList, MovieList).

getMoviesByGenres([], []).
getMoviesByGenres([Genre|GenreTail], Movies):-
    getMoviesByGenres(GenreTail, TailMovies),
    filter_by_genre_list(Genre, GenreMovies),
    append(GenreMovies, TailMovies, Movies).

sort_movies_by_rating(Movies, ByRating) :-
        pair_rating_movies(Movies,Pairs),
        keysort(Pairs, Sorted),
        pairs_values(Sorted, ByRating).

pair_rating_movies([], []).
pair_rating_movies([Movie|MovieTail], Pairs) :-
    pair_rating_movies(MovieTail, TailPairs),
    rating(Movie, MovieRating),
    append(TailPairs, [MovieRating-Movie], Pairs).