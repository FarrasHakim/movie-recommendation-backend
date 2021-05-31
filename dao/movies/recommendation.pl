:- [filter/director].
:- [filter/genre].
:- [sort/rating].

filterMoviesRecommendationByMovie(Movie, MovieList):-
    director(Movie, Director),
    findall(Genre, genre(Movie, Genre), GenreList),        
    getMoviesByGenres(GenreList, MoviesByGenres),
    sort_movies_by_rating(MoviesByGenres, GenreByRating),
    filterMoviesByDirector(Director, MoviesByDirector),
    sort_movies_by_rating(MoviesByDirector, DirectorByRating),
    subtract(GenreByRating, DirectorByRating, ReducedGenreByRating),
    append(ReducedGenreByRating, DirectorByRating, ReversedMovieList),
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