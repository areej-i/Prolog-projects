%player(name(First,Last),team(City),pos(Position),stats(Goals,Assists,Shots))
player(name(alex,ovechkin),team(was),pos(lw),stats(51,38,338)).
player(name(marcus,pettersson),team(pit),pos(d),stats(2,23,87)).
player(name(kevin,fiala),team(min),pos(lw),stats(13,26,174)).
player(name(ryan,hartman),team(min),pos(rw),stats(12,14,145)).
player(name(leon,driasaitl),team(edm),pos(c),stats(50,55,231)).
player(name(john,tavares),team(tor),pos(c),stats(47,41,286)).
player(name(steven,stamkos),team(tb),pos(c),stats(45,53,234)).
player(name(nikita,kucherov),team(tb),pos(rw),stats(41,87,246)).
player(name(nathan,mackinnon),team(col),pos(c),stats(41,58,365)).
player(name(alex,debrincat),team(chi),pos(rw),stats(41,35,220)).
player(name(jake,guentzel),team(pit),pos(lw),stats(40,36,227)).
player(name(jeff,skinner),team(buf),pos(lw),stats(40,23,268)).
player(name(mark,scheifele),team(wpg),pos(c),stats(38,46,199)).
player(name(johnny,gaudreau),team(cgy),pos(lw),stats(36,63,245)).
player(name(mike,hoffman),team(fla),pos(lw),stats(36,34,253)).
player(name(aleksander,barkov),team(fla),pos(c),stats(35,61,206)).
player(name(morgan,rielly),team(tor),pos(d),stats(20,52,223)).
player(name(brent,burns),team(sj),pos(d),stats(16,67,300)).
player(name(patrick,kane),team(chi),pos(rw),stats(44,66,341)).


% On what team does Ryan Hartman play, and in what position?
?- player(name(ryan,hartman),Team,Position,_).
Team = team(min),
Position = pos(rw).

% What is the last name of any player who has at least 52 assists?
?- player(name(_,LastName),_,_,stats(_,52,_)).
LastName = rielly ;

% What players play left wing?
?- player(Name,_,pos(lw),_).
Name = name(alex, ovechkin) ;
Name = name(kevin, fiala) ;
Name = name(jake, guentzel) ;
Name = name(jeff, skinner) ;
Name = name(johnny, gaudreau) ;
Name = name(mike, hoffman).

% What teams have a player with the first name "Alex"?
player(name(alex,_),Team,_,_).
Team = team(was) ;
Team = team(chi).

% What pairs of players play on the same team?
?- player(Name,Team,_,_), player(Name2,Team2,_,_), Name\=Name2, Team=Team2.
Name = name(marcus, pettersson),
Team = Team2, Team2 = team(pit),
Name2 = name(jake, guentzel) ;
Name = name(kevin, fiala),
Team = Team2, Team2 = team(min),
Name2 = name(ryan, hartman) ;
Name = name(ryan, hartman),
Team = Team2, Team2 = team(min),
Name2 = name(kevin, fiala) ;
Name = name(john, tavares),
Team = Team2, Team2 = team(tor),
Name2 = name(morgan, rielly) ;
Name = name(steven, stamkos),
Team = Team2, Team2 = team(tb),
Name2 = name(nikita, kucherov) ;
Name = name(nikita, kucherov),
Team = Team2, Team2 = team(tb),
Name2 = name(steven, stamkos) ;
Name = name(alex, debrincat),
Team = Team2, Team2 = team(chi),
Name2 = name(patrick, kane) ;
Name = name(jake, guentzel),
Team = Team2, Team2 = team(pit),
Name2 = name(marcus, pettersson) ;
Name = name(mike, hoffman),
Team = Team2, Team2 = team(fla),
Name2 = name(aleksander, barkov) ;
Name = name(aleksander, barkov),
Team = Team2, Team2 = team(fla),
Name2 = name(mike, hoffman) ;
Name = name(morgan, rielly),
Team = Team2, Team2 = team(tor),
Name2 = name(john, tavares) ;
Name = name(patrick, kane),
Team = Team2, Team2 = team(chi),
Name2 = name(alex, debrincat) ;
false.
% What players have between 90 and 100 points (inclusive)? (where points = goals + assists)
?- player(Name,_,_,stats(Goals,Assists,_)), Goals+Assists>=90, Goals+Assists=<100.

% What is the shot accuracy of the player with the least goals? (where shot accuracy = goals / shots)

% Who is the most accurate centre player?