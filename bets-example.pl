equipe(username, ["Team 1", "Team 2", "Team 3"]).
equipe(otherUser, ["Team 2", "Team 7", "Other Team"]).
% ...

expect(username, "Team 1", "Team 7", 0, 7).
expect(username, "Team 3", "Team 5", 1, 2).
%...

expect(otherUser, "Team 1", "Team 7", 4, 7).
expect(otherUser, "Team 3", "Team 5", 4, 2).
%...

