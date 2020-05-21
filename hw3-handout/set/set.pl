isUnion([],[],[]).
isUnion(Set,[],Set).
isUnion([],Set,Set).

isUnion([H1|T1],Set2,Union) :-
    member(H1,Set2),
    isUnion(T1,Set2,Union).

isUnion([H1|T1],Set2,[H1|T3]) :-
    not(member(H1,Set2)),
    isUnion(T1,Set2,T3).
    
isIntersection([],_,[]).
isIntersection(_,[],[]).

isIntersection([H1|T1],Set2,[H1|T3]) :-
    member(H1,Set2),
    isIntersection(T1,Set2,T3).
    
isIntersection([H1|T1],Set2,Intersection) :-
    not(member(H1,Set2)),
    isIntersection(T1,Set2,Intersection).

is_found([],_).
is_found([Head|Tail], Set2) :-
    member(Head, Set2),
    is_found(Tail, Set2).

isEqual(Set1,Set2) :-
    is_found(Set1, Set2).
    
