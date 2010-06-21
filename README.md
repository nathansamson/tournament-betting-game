Tournament betting game
=======================

What Is It?
----------
Its a script to calcute points  for a game to guess tournament results
(a typical football tournament for example)
Rules are
*	Each player chooses X teams (his equipe)
*	When a team in a players team plays a match, the player get points
	according to the result of the team
	-	Team wins: 5 points
	-	Team tie: 3 ponts
	-	Team loose: 1 point
	-	For each scored point of a team +1
*	The tournament is played in rounds, for each match played in the
	first round the player should guess the result.
	-	If the result is completely correct 7 points
	-	Else if the result (X wins, or tie) is correct +2 points
	-	If one score is correct +1
		(Possible points are
		+	7 (result correct)
		+	3 (correct winner + one score correct)
		+	2 (correct winner, no score correct)
		+	1 (one score correct)
*	Player with most points scored (from both his equipe, and match guesses)
	wins the game.

Howto use
---------
Create bets.pl and results.pl (examples in bets-example.pl and wk2010-dutch.pl)
Run prolog and load the scripts
	prolog
	?-
	?- [bets].
	?- [results].
	?- [wk2010].
  

To get a list of all user with their points
	?- allPoints(X).
		X = [[best, 100], [second, 80], ...]

To get a list of the 2 best players
	?- winners(First, Second).
		First = best,
		Second = second.
