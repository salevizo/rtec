intDurGreater(If,V,I):- findall((S,E), (member((S,E), If),(( E\= inf, Diff is E - S, Diff > V);( E = inf))), I).
intDurLess(If,V,I):-findall((S,E), (member((S,E), If),( E\= inf, Diff is E - S, Diff < V)), I).

fmod(A,B,M):- Div is A/B,Fln is floor(Div) * B,M is A-Fln.

absoluteAngleDiff(An1,An2,C):-A is An1-An2, A1 is A+180, fmod(A1,360,FM), C is abs(FM-180).


withinAreaType(Vessel,Type,I):- findall(Iwa,
                                           (holdsFor(withinArea(Vessel,Area) = true, Iwa),
                                            Iwa\=[],
                                            areaType(Area,Type)
                                           ),L),union_all(L,I).
