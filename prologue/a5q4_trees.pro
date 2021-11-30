%[1 mark] Write a predicate list/1 that succeeds if the argument is a list. 
%(You may not use the built-in is_list predicate for this).
list(X):-not(var(X)).
list([]).
list([_|_]).

list([3,2,1]). %→ True.
list([3]). %→ True.
list(dfjsdf). %→ False.

%[4 marks] Write a predicate treeFlat/2 which takes a tree T as argument and returns the flattened list 
%containing all of the elements in T. You may not use the built-in flatten predicate in your answer.
treeFlat(X,[X]) :- not(is_list(X)).
treeFlat([],[]).
treeFlat([H|T],G) :- treeFlat(H,D), treeFlat(T,F), append(D,F,G).

%treeFlat([a, [b, [c, d], e]],[1,2,3,4,5,6]). → False.
%treeFlat([[a,b],[1, [d]], 2,f], L). → L = [a,b,1,d,2,f]
%treeFlat([[3], [4, [5, 6], [7,8,9]]], L). → L = [3, 4, 5, 6, 7, 8, 9]
%treeFlat([[3], [4, [5, 6], [7,8,9]]], [3, 4, 5, 6, 7, 8, 9]). → True.

%[3 marks] Write a predicate treeSum/2 which has two parameters T and S, that succeeds if the sum of 
%all elements in the tree T equals the number S. You may not use the built-in sumlist predicate in your answer.
treeSum(T,S):-treeFlat(T,L), listSum(L,S).
listSum([],0).
listSum([H|T], S):- listSum(T, S1), S is H+S1.

%treeSum([[3],[4, [5, 6],[7,8,9]]], S). → S = 24
%treeSum([13,[12, 10],[9,8,[7]]], S). → S = 59


%[6 marks] Write a predicate treeSmush/2 which takes a tree T as argument and returns a tree in 
%which any two adjacent sublists have been merged into one sublist.
treeSmush([],_).
%treeSmush([H|T],R):- is_list(H), H\==[],treeSmush2(H,T,R);treeSmush4(H,T,R). 
treeSmush([H|T],R):- treeSmush4(H,T,R). 
treeSmush4(_,[],_).
%treeSmush2([H|H1], T, R):- is_list(H1), H1\==[], append(H,H1,H2), append([H2],T,R), treeSmush3(H2,H1,R); treeSmush([H],T,R).
%treeSmush3(H, [H1|H2], R):- is_list(H1),is_list(H2), H2\==[], append(H1,H2,H3), append (H3,H,H4), treeSmush([H4],H2,R).
%treeSmush4(_,[],_).
treeSmush4(H, [T|T1], R):- is_list(H), T\==[], is_list(T), append(H,T,R1), append([R1],T1,R), treeSmush(T1,R); treeSmush(T,R). 
%treeSmush([[[1],[2],[3]],4,[5]], R). 

%  testing
%treeSmush([[1],[2],3,[4]], R).→ R = [[1,2],3,[4]]


