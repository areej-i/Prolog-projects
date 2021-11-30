%[2 marks] Write a predicate random_int/3 that takes two integers A and B as arguments and returns a random integer in the range [A,B]. 
%You may not use the built-in random_between/3 predicate.
random_int(A,B,R):- random(X), Y is +(*(X, -(B, A)), A), R is integer(Y).

%testing
random_int(7,7,R). %→ R=7
random_int(-7,-3,R). %→ R=-5
random_int(3,15,R). %→ R=13

%[3 marks] Write a predicate range/3 that takes two integers A and B as arguments and returns a list of all integers in the range [A,B].
range(A,A,[A]) :- !.
range(A,B,[A|T]) :-
    A =< B,
    A1 is A+1,
    range(A1,B,T).

%testing
range(-5,2,L). %→ L = [-5, -4, -3, -2, -1, 0, 1, 2].
range(2,2,L). %→ L = [2].
range(5,3,L). %→ false.

%[3 marks] Write a predicate remove_nth/4 that takes an integer N and a list L as arguments and returns the Nth item, as 
%well as the Remaining list without the removed item. (You may not use the built in nth0 or nth1 predicates).
remove_nth(0,[A|T],A,T).
remove_nth(N,[H|T],A,[H|T1]) :- N > 0, 
   N1 is N - 1, remove_nth(N1,T,A,T1).

%E.g. 
remove_nth(0,[2,4,6,8,10],A,B). %→ A=2, B=[4,6,8,10]
remove_nth(4,[a,b,c,d,e,f,g,h,i],A,B). %→ A=e, B=[a,b,c,d,f,g,h,i]
remove_nth(-4,[a,b,c,d,e,f,g,h,i],A,B). %→ false
remove_nth(20,[a,b,c,d,e,f,g,h,i],A,B). %→ false

%[4 marks] Write a predicate select_random/3 that takes an integer N and a list L as arguments and returns N different random 
%elements selected from L.
remove_n(H,[H|T],1,T).
remove_n(H,[H1|T],N,[H1|T1]) :- N > 1, 
   N1 is N - 1, remove_n(H,T,N1,T1).
select_random(0,_,[]).
select_random(N,L,[H|R]) :- N > 0,
    length(L,L1),
    L1 > N,
    A is random(L1) + 1,
    remove_n(H,L,A,T),
    N1 is N - 1,
    select_random(N1,T,R).

% testing
select_random(4,[a,b,c,d,e,f,g,h],L). %→ L = [b, h, a, c] .
select_random(10,[a,e,i,o,u],L). %→ false.

%[2 marks] Write a predicate lotto/1 that returns a list of 7 unique random integers from the range [1,50] in sorted order.
lotto(L):- length(L1, 7), maplist(random(1,50), L1), sort(L1,L).

% testing
lotto(L). %→ [1,7,13,23,33,36,49]
lotto(L). %→ [7,25,28,29,41,45,47]
