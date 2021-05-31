filter_by_year(Year, MovieDetailList) :- 
    atom_number(Year, YearNumber),
    findall(Movie, movie(Movie, YearNumber), MovieList),
    movie_list_to_detail_list(MovieList, MovieDetailList).