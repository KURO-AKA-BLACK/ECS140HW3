reachable(State,State,[]).
reachable([State],State,[]).

reachable([H|T], FinalState, [IH|IT]) :-
    transition(H,IH,[N_H|N_T]),
    (
        reachable(T, FinalState, IH);
        reachable(N_T, FinalState, IT);
        reachable(N_H, FinalState, IT)
    ).

reachable(StartState, FinalState, Input) :-
    [Head|Tail] = Input,
    transition(StartState,Head,[H|T]),
    (
        reachable(H,FinalState,Tail);
        reachable(T,FinalState,Tail)
    ).