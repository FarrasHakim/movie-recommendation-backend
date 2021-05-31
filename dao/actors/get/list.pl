list_actors(Movie, List) :-
    findall(Actor, actor(Movie, Actor, _);actress(Movie, Actor, _), List).