myappend([],L,L).
myappend([X|L1],L2,[X|L3]) :- myappend(L1,L2,L3).

isUnion([],[],[]).
isUnion(Set,[],Set).
isUnion([],Set,Set).

isUnion(Set1,Set2,Union) :-
    [H1|T1] = Set1,
    member(H1,Set2),
    isUnion(T1,Set2,Union).

isUnion(Set1,Set2,Union) :-
    [H1|T1] = Set1,
    not(member(H1,Set2)),
    Union = [H1|T3],
    isUnion(T1,Set2,T3).
    
isIntersection([],_,[]).
isIntersection(_,[],[]).

isIntersection(Set1,Set2,Union) :-
    [H1|T1] = Set1,
    member(H1,Set2),
    Union = [H1|T3],
    isIntersection(T1,Set2,T3).
    
isIntersection(Set1,Set2,Intersection) :-
    [H1|T1] = Set1,
    not(member(H1,Set2)),
    isIntersection(T1,Set2,Intersection).

is_found([],_).
is_found([Head|Tail], Set2) :-
    member(Head, Set2),
    is_found(Tail, Set2).

isEqual(Set1,Set2) :-
    is_found(Set1, Set2).
    
