%Name: Areej Irfan
%Student number: 101149642
%edge(SourceCity, DestinationCity, DistanceInKm). 
% indicates a directed edge exists starting in sourceCity and ending DistanceInKm kilometers away at DestinationCity.

%Our network
edge(toronto, montreal,	    505.48).
edge(vancouver, calgary,    676.14 ).
edge(ottawa, edmonton, 	    2836.48).
edge(mississauga, winnipeg,	1500.94).
edge(hamilton, 	quebec, 	792.82).
edge(brampton, kitchener, 	63.3).
edge(surrey, laval, 	    3652.17).
edge(london, victoria, 	    3284.25).
edge(halifax, markham, 	    1248.92).
edge(oshawa, gatineau, 	    304.38).
edge(vaughan, longueuil, 	511.46).
edge(windsor, burnaby, 	    3152.44).
edge(saskatoon, barrie,     2156.81).
edge(regina, richmond, 	    1331.75).
edge(oakville, 	burlington, 14.34).
edge(richmondHill, 	sherbrooke, 621.01).
edge(saguenay, 	stCatharines, 	861.28).
edge(montreal, regina,      2357.61).
edge(stCatharines, stJohns, 2119.33).
edge(waterloo, levis,       820.92).
edge(coquitlam, oakville,    3322.22).
edge(london, terrebonne,    675.47).
edge(thunderBay, kelowna, 	2185.74).
edge(stJohns, saintJohn,    1048.48).
edge(waterloo, 	terrebonne, 597.7).
edge(brantford, ajax, 	    127.48).
edge(ottawa, thunderBay,    1383.57).
edge(levis, troisRivieres, 	116.28).
edge(abbotsford, cambridge, 3244.06).
edge(kingston, 	guelph, 	311.27).
edge(coquitlam, whitby, 	3353.39).
edge(kelowna, laval,        4186.07).
edge(oakville, london,      155.94 ).
edge(cambridge, edmonton,   3385.31 ).
edge(troisRivieres, surrey, 4660.99 ).
edge(victoria,halifax,      6207.31 ).
edge(guelph, waterloo,      23.73 ).
edge(kelowna, gatineau,     3265.9).
edge(stJohns, laval,        1618.64).
edge(barrie,oshawa,         85.46 ).
edge(edmonton, ottawa,      2836.48).
edge(winnipeg, halifax,     2575.26 ).
edge(laval, hamilton,       550.99).
edge(richmond, guelph,      3304.26).
edge(burlington,coquitlam,   4304.81).
edge(ajax, abbotsford,      3320.8 ).
edge(cambridge, victoria,   3333.53 ).
edge(gatineau, saskatoon,   2363.13 ).
edge(saintJohn, hamilton,   1120.76).
edge(terrebonne, toronto,   507.8).

%[3 marks] Firstly, our commuters are reporting difficulty interpreting the provided knowledgebase. 
%Please help our commuters find out if they can get where they're going by creating a Prolog predicate connected(A,B) 
%that succeeds if there is a path of 1 or more edges from city A to city B.

connected(A,B):- edge(A,B,_); edge(B,A,_); connected(A,B,_).
connected(A,B,_):- edge(A,X,_), edge(X,B,_); edge(A,X,_), edge(X,Y,_), edge(Y,B,_).
%connected(ottawa,gatineau). → True.
%connected(ottawa,toronto). → False.

%Next, to reduce the disorienting effects of the hypersonic ping-ponging pathways of our travel network, 
%we would like to provide our commuters with a simple listing of the stopovers that they will experience along their 
%journey. Create a Prolog predicate commuterPath(A,B,L) that succeeds if L is the list of cities along the path between 
%city A and city B (if such a path exists).

%commuterPath(A, B, P,_):- edge(A,X,_), edge(X,B,_), append(P,X,R), append(R,B,R2); edge(A,X,_), edge(X,Y,_), edge(Y,B,_), append(P,X,R), append(R,Y,R2), append(R2,B,R3).
%commuterPath(A, B, P):- connected(A,B), edge(A,B,_), P = [A|B]; connected(A,B), edge(B,A,_), P = [B|A]; connected(A,B), commuterPath(A, B, [A|_] ,_).
%commuterPath(ottawa, gatineau, Path). → Path = [ottawa, thunderBay, kelowna, gatineau].


