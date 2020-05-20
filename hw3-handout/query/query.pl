year_1953_1996_novels(Book) :-
    novel(Book, Year),
    (Year =:= 1953; Year =:= 1996).

period_1800_1900_novels(Book) :-
    novel(Book, Year),
    Year >= 1800, 
    Year =< 1900.

is_lord([Head|_]) :-
    Head = 'the_lord_of_the_rings'.

is_lord([_|Tail]) :-
    is_lord(Tail).

lotr_fans(Fan) :-
    fan(Fan, Books),
    is_lord(Books).

is_Author_one(Abooks,[Head|Tail]) :-
    is_Author_two(Abooks, Head);
    is_Author_one(Abooks, Tail).
    
is_Author_two([H|_], Head) :-
    H = Head.

is_Author_two([_|T], Head) :-
    is_Author_two(T, Head).

author_names(Author) :-
    fan('chandler', Books),
    author(Author, Abooks),
    is_Author_one(Abooks, Books).

fans_names(Fan) :-
    author('brandon_sanderson', Books),
    fan(Fan, Fan_books),
    is_Author_one(Fan_books, Books).

mutual_novels(Book) :-
    fan('phoebe', P_books),
    fan('ross', R_books),
    fan('monica', M_books),
    (
        (is_Author_two(P_books,Book), is_Author_two(R_books,Book));
        (is_Author_two(P_books,Book), is_Author_two(M_books,Book));
        (is_Author_two(R_books,Book), is_Author_two(M_books,Book))
    ).