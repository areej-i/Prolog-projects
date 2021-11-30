% Establish a database of facts with the members of a family tree for the following clauses:
male(bilal). % brother
male(dad). % mom
male(dada). % grandpa
male(nana). % grandpa
male(ijaz). % uncle
female(areej). % me
female(jasra). % sister
female(mom). % mom
female(nani). % grandma
female(dadi). % grandma
female(kasar). % aunt by marriage
female(annie). % aunt by lineage
female(aimon). % cousin
female(ggrandma). % ancestor

father(dad,areej). % X is the father of Y
father(dad,jasra). 
father(dad,bilal). 
father(nana,mom).
father(nana,annie).
father(dada,dad).
father(dada,ijaz).
father(ijaz,aimon).
mother(mom,areej). % X is the mother of Y
mother(mom,bilal). 
mother(mom,jasra). 
mother(nani,mom).
mother(nani,annie).
mother(dadi,dad).
mother(dadi,ijaz).
mother(kasar,aimon).
mother(ggrandma,dadi).
married(mom,dad). % X is married to Y
married(kasar,ijaz).
married(dadi,dada).
married(nani,nana).

% Write prolog rules to define the following relationships:
parent(X,Y):- father(X,Y); mother(X,Y). % True if X is a parent of Y
siblings(X,Y):- mother(M,Y), father(F,X), X\==Y, married(M,F). % True if X and Y are siblings
has_sister(X):- mother(M,Y), father(F,X), married(M,F), X\==Y, female(Y). % True if X has a sister
has_brother(X):- mother(M,Y), father(F,X), married(M,F), X\==Y, male(Y). % True if X has a brother
aunt(X,Y):- female(X), father(D,Y), siblings(X,D); female(X), mother(M,Y), siblings(X,M); female(X), father(D,Y), married(X,B), siblings(B,D); female(X), mother(M,Y), married(X,B), siblings(B,M).
uncle(X,Y):- male(X), father(D,Y), siblings(X,D); male(X), mother(M,Y), siblings(X,M); male(X), father(D,Y), married(S,X), siblings(S,D); male(X), mother(M,Y), married(S,X), siblings(S,M). % True if X is an uncle of Y (by lineage or by marriage)
cousin(X,Y):- parent(P,X), parent(Q,Y), siblings(P, Q). % True if X and Y are cousins
grandfather(X,Y):- father(F,Y), father(X,F); mother(M,Y), father(X,M). % True if X is a grandfather of Y
grandmother(X,Y):- father(F,Y), mother(X,F); mother(M,Y), mother(X,M). % True if X is a grandmother of Y
ancestor(X,Y):- grandfather(G,Y), father(X,G); grandfather(G,Y), mother(X,G); grandmother(G,Y), father(X,G); grandmother(G,Y), mother(X,G). % True if X is an ancestor of Y