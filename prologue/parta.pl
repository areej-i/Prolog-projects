join([], L, L).
join([H|L1], L2, [H|L3]):-
    join(L1, L2, L3).

split(L,0,[],L).
split([X|Xs],N,[X|Ys],Zs) :- N > 0, N1 is N - 1, split(Xs,N1,Ys,Zs).


fold_once(L,R):- R == [],length(L,N), N1 is N//2, split(L,N1,L1,L2), reverse(L2,X), X1 = X, fold_once(L,X). %fold(L1,X,R). %split list in half and reverse it
fold_once(L,X).
%fold(R).
%fold(H1,[],R):- join(H1,R,R1).
%fold([],H1,R):- join(H1,R,R1).
%fold([],[],R):-fold(R).
fold([H|T],[H1|T1],L3):- H2 is H + H1, join([H2],L3,R). %, fold(T,T1,R).


% Q2
slice([H|_],0,1,[H]).
slice([H|T],0,K,[H|T1]):- K > 1, K1 is K - 1, slice(T,0,K1,T1).
slice([_|T],I,K,T1) :- I > 0, I1 is I - 1, K1 is K - 1, slice(T,I1,K1,T1).


% Q6
transfer(H,[],[],[H]).
transfer(H,[H1|T1],[H1|T1],[H]) :- H \= H1.
transfer(H,[H|T],T1,[H|X1]) :- transfer(H,T,T1,X1).
pack([],[]).
pack([H|T],[X|X1]) :- transfer(H,T,T1,X), pack(T1,X1).
transform([],[]).
transform([[H|T]|T1],[[H,N]|X1]) :- length([H|T],N), transform(T1,X1).
globs(L1,L2) :- pack(L1,L), transform(L,L2).

remove_at(H,[H|T],1,T).
remove_at(H,[Y|T],K,[Y|T1]) :- K > 1, K1 is K - 1, remove_at(H,T,K1,T1).
insert_at(H,L,K,R) :- remove_at(H,R,K,L).

infuse(L,P,N,L2,R):- N > 0, remove_at(K,L,P,L3),
infuse([1,2,3],1,1,[a,b,c],R). → R = [1,a,b,c,3].
infuse([1,2,3],3,1,[a,b],R). → R = [1,2,3].
infuse([0,1,2,3,4,5,6,7],4,2,[],R). → R = [0,1,2,3,6,7]