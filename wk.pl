win(X) :- match(_, X, _, P1, P2), P2 > P1.
win(X) :- match(X, _, _, P1, P2), P1 > P2.

loose(X) :- match(_, X, _, P1, P2), P1 > P2.
loose(X) :- match(X, _, _, P1, P2), P2 > P1.

equal(X) :- match(_, X, _, P1, P2), P1 = P2.
equal(X) :- match(X, _, _, P1, P2), P1 = P2.

sum([], 0).
sum([H|T], S) :- sum(T, ST), S is H + ST.

goals(X, G) :- findall(P1, match(X, _, _, P1, _), Home),
               findall(P2, match(_, X, _, _, P2), Out),
               sum(Home, SH), sum(Out, SO),
               G is SH + SO.

points(X, P) :-
	findall(_, win(X), W),
        findall(_, loose(X), L),
        findall(_, equal(X), E),
        length(W, WL), length(L, LL), length(E, EL),
	goals(X, G),
        P is WL * 5 + LL + EL * 3 + G.

equipeHelperPoints([], 0).
equipeHelperPoints([H|T], P) :- 
	points(H, P1),
	equipeHelperPoints(T, P2),
	P is P1 + P2.

equipePoints(X, P) :-
	equipe(X, E),
	equipeHelperPoints(E, P).

correctWinner(PA, PB, PEA, PEB) :- PA > PB, PEA > PEB.
correctWinner(PA, PB, PEA, PEB) :- PA = PB, PEA = PEB.
correctWinner(PA, PB, PEA, PEB) :- PA < PB, PEA < PEB.
correctGoals(PA, PB, PA, PB, 2).
correctGoals(PA, _, PA, _, 1).
correctGoals(_, PB, _, PB, 1).
correctGoals(_, _, _, _, 0).

expectPointsFor([], _, 0).
expectPointsFor([[A, B, PA, PB]|T], X, P) :-
	expect(X, A, B, PEA, PEB),
	PEA = PA, PEB = PB,
	expectPointsFor(T, X, PT),
	P is PT + 7.

expectPointsFor([[A, B, PA, PB]|T], X, P) :-
        expect(X, A, B, PEA, PEB),
        correctWinner(PA, PB, PEA, PEB),
	correctGoals(PA, PB, PEA, PEB, CG),
        expectPointsFor(T, X, PT), 
        P is PT + 2 + CG.

expectPointsFor([[A, B, PA, PB]|T], X, P) :-
        expect(X, A, B, PEA, PEB),
        correctGoals(PA, PB, PEA, PEB, CG),
        expectPointsFor(T, X, PT),
        P is PT + CG.

expectPointsFor([_|T], X, P) :-
	expectPointsFor(T, X, P).

expectPoints(X, P) :-
	findall([A, B, PA, PB], match(A, B, 1, PA, PB), M),
	expectPointsFor(M, X, P), !.

totalPoints(X, P) :-
	expectPoints(X, P1), equipePoints(X, P2),
	P is P1 + P2.

memap([], _, []).
memap([H|T], F, [[H, R]|L1]) :-
	call(F, H, R),
	memap(T, F, L1).

smaller(_, [], []).
smaller([N, P], [[ON, OP]|T], [[ON, OP]|ST]) :- OP =< P, smaller([N, P], T, ST).
smaller([N, P], [[_, OP]|T], ST) :- OP > P, smaller([N, P], T, ST).

larger(_, [], []).
larger([N, P], [[ON, OP]|T], [[ON, OP]|ST]) :- OP > P, larger([N, P], T, ST).
larger([N, P], [[_, OP]|T], ST) :- OP =< P, larger([N, P], T, ST).

qsort([], []).
qsort([P|R], C) :-
	smaller(P, R, FU), larger(P, R, TU),
	qsort(FU, FS), qsort(TU, TS),
	append(TS, [P], CF),
	append(CF, FS, C).


allPoints(X) :-
	findall(U, equipe(U, _), AU),
	memap(AU, totalPoints, XU),
	qsort(XU, X).

winners(X, Y) :-
	allPoints([X, Y|_]).
