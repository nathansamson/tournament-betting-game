% Second round (1/8 finals)
match("Uruguay", "Zuid-Korea", 2, 2, 1, 2, 1).
match("VS", "Ghana", 2, 1, 1, 1, 2).
match("Duitsland", "Engeland", 2, 4, 1, 4, 1).
match("Argentinië", "Mexico", 2, 3, 1, 3, 1).
match("Nederland", "Slovakije", 2, 2, 1, 2, 1).
match("Brazilië", "Chili", 2, 3, 0, 3, 0).
match("Paraguay", "Japan", 2, 0, 0, 5, 3).
match("Spanje", "Portugal", 2, 1, 0, 1, 0).

match("Nederland", "Brazilië", 1, 2, 1, 2, 1).

match(X, Y, 1, P1, P2, P1, P2) :- match(X, Y, 1, P1, P2).
% A, first round
match("Zuid-Afrika", "Mexico", 1, 1, 1).
match("Uruguay", "Frankrijk", 1, 0, 0).
match("Zuid-Afrika", "Uruguay", 1, 0, 3).
match("Frankrijk", "Mexico", 1, 0, 2).
match("Mexico", "Uruguay", 1, 0, 1).
match("Frankrijk", "Zuid-Afrika", 1, 1, 2).

% B, first round
match("Zuid-Korea", "Griekenland", 1, 2, 0).
match("Argentinië", "Nigeria", 1, 1, 0).
match("Argentinië", "Zuid-Korea", 1, 4, 1).
match("Griekenland", "Nigeria", 1, 2, 1).
match("Nigeria", "Zuid-Korea", 1, 2, 2).
match("Griekenland", "Argentinië", 1, 0, 2).

% C, First round

match("Engeland", "VS", 1, 1, 1).
match("Algerije", "Slovenië", 1, 0, 1).
match("Slovenië", "VS", 1, 2, 2).
match("Engeland", "Algerije", 1, 0, 0).
match("Slovenië", "Engeland", 1, 0, 1).
match("VS", "Algerije", 1, 1, 0).

% D
match("Servië", "Ghana", 1, 0, 1).
match("Duitsland", "Australië", 1, 4, 0).
match("Duitsland", "Servië", 1, 0, 1).
match("Ghana", "Australië", 1, 1, 1).
match("Ghana", "Duitsland", 1, 0, 1).
match("Australië", "Servië", 1, 2, 1).

% E
match("Nederland", "Denemarken", 1, 2, 0).
match("Japan", "Kameroen", 1, 1, 0).
match("Nederland", "Japan", 1, 1, 0).
match("Kameroen", "Denemarken", 1, 1, 2).
match("Denemarken", "Japan", 1, 1, 3).
match("Kameroen", "Nederland", 1, 1, 2).

% F
match("Italië", "Paraguay", 1, 1, 1).
match("Nieuw-Zeeland", "Slowakije", 1, 1, 1).
match("Slowakije", "Paraguay", 1, 0, 2).
match("Italië", "Nieuw-Zeeland", 1, 1, 1).
match("Slowakije", "Italië", 1, 3, 2).
match("Paraguay", "Nieuw-Zeeland", 1, 0, 0).

% G
match("Ivoorkust", "Portugal", 1, 0, 0).
match("Brazilië", "Noord-Korea", 1, 2, 1).
match("Brazilië", "Ivoorkust", 1, 3, 1).
match("Portugal", "Noord-Korea", 1, 7, 0).
match("Noord-Korea", "Ivoorkust", 1, 0, 3).
match("Portugal", "Brazilië", 1, 0, 0).


% H
match("Chili", "Zwitserland", 1, 1, 0).
match("Honduras", "Chili", 1, 0, 1).
match("Spanje", "Zwitserland", 1, 0, 1).
match("Spanje", "Honduras", 1, 2, 0).
match("Zwitserland", "Honduras", 1, 0, 0).
match("Chili", "Spanje", 1, 1, 2).

