:- use_module(library(lists)).

%
% Return the cell inside which a point lies
% (this requires some of the grid features,
% i.e., it is grid dependent)
%
findEnclosingCell((Lon0,Lat0),Cell):-
    gedGridFeatures(XStart,YStart,XStep,YStep),
    % note that we first need to convert to integers,
    % since mod does not work with floats here
    % (assumption: Lon/Lat have at most 6 decimal digits)
    format(atom(FLon),'~6f', Lon0), atom_number(FLon, Lon), format(atom(FLat),'~6f', Lat0), atom_number(FLat, Lat),
    MU is 1000000,
    X is round(Lon * MU),
    Y is round(Lat * MU),
    XSa is round(XStart * MU),
    XSe is round(XStep * MU), 
    YSa is round(YStart * MU),
    YSe is round(YStep * MU),
    LLX is X - ((X-XSa) mod XSe),
    LLY is Y - ((Y-YSa) mod YSe),
    LowLeftX is float(LLX / MU),
    LowLeftY is float(LLY / MU),
    Cell = [(LowLeftX,LowLeftY)], !.

harvesineDistance((Lon1,Lat1),(Lon2,Lat2),Dist) :-
    Lon1Rad is Lon1 * (pi/180),
    Lat1Rad is Lat1 * (pi/180),
    Lon2Rad is Lon2 * (pi/180),
    Lat2Rad is Lat2 * (pi/180),
    Dlon is Lon2Rad - Lon1Rad,
    Dlat is Lat2Rad - Lat1Rad,
    A is (sin(Dlat/2))^2 + cos(Lat1Rad)*cos(Lat2Rad)*(sin(Dlon/2))^2,
    C is 2*atan2(sqrt(A),sqrt(1-A)),
    % Earth radius: 3961 miles / 6371 km
    % Dist in km
    Dist is 6371*C.
    % Dist in miles
    %Dist is 3961*C.
    %Dist is sqrt( abs(Lon2-Lon1)^2 +abs(Lat2-Lat1)^2 ).

portDistance(Lon,Lat,farFromPorts):-
    nearPorts(Lon,Lat,[]).

portDistance(Lon,Lat,nearPort):-
    \+nearPorts(Lon,Lat,[]).

nearPorts(Lon,Lat,Ports) :-
    getNearbyPorts(Lon,Lat,NearPorts),!,
    checkIfClose(Lon,Lat,NearPorts,Ports).

getNearbyPorts(Lon,Lat,NearPorts) :-
    getCellsAroundPoint(Lon,Lat,Cells),
    getPortsInCells(Cells,NearPorts).


getCellsAroundPoint(Lon,Lat,Cells) :- 
    findEnclosingCell((Lon,Lat), Cell),
    nth0(0,Cell,LowLeft),
    LowLeft = (X0,Y0),
    gridCell(Cell0,X0,Y0),
    gedGridFeatures(_XStart,_YStart,XStep,YStep),
    MU is 1000000,
    X1 is float(round(MU*(X0 - XStep))/MU), Y1 is float(round(MU*(Y0 - YStep))/MU),
    X2 is X0, Y2 is Y1,
    X3 is float(round(MU*(X0 + XStep))/MU), Y3 is Y1,
    X4 is X3, Y4 is Y0,
    X5 is X3, Y5 is float(round(MU*(Y0 + YStep))/MU),
    X6 is X0, Y6 is Y5,
    X7 is X1, Y7 is Y5,
    X8 is X1, Y8 is Y0,
    getCellsFromPoints([(X0,Y0),(X1,Y1),(X2,Y2),(X3,Y3),(X4,Y4),(X5,Y5),(X6,Y6),(X7,Y7),(X8,Y8)],Cells).

getCellsFromPoints([],[]) :- !.
getCellsFromPoints([(X,Y)|OtherPoints],Cells) :-
    gridCell(C,X,Y),
    getCellsFromPoints(OtherPoints,OtherCells),!,
    append([C],OtherCells,Cells).
getCellsFromPoints([_Point|OtherPoints],Cells) :-
    getCellsFromPoints(OtherPoints,Cells),!.

getPortsInCells(Cells,Ports) :- 
    getPortsInCells2(Cells,[],Ports).
getPortsInCells2([],PreviousPorts,PreviousPorts) :- !.
getPortsInCells2([Cell|OtherCells],PreviousPorts,Ports) :-
    findall(Port, portInCell(Cell,Port), CPorts),
    append(CPorts,PreviousPorts,NewPorts),
    getPortsInCells2(OtherCells,NewPorts,Ports).


checkIfClose(Lon,Lat,Ports,ClosePorts) :-
    checkIfClose2(Lon,Lat,Ports,[],ClosePorts).
checkIfClose2(_Lon,_Lat,[],PreviousClosePorts,PreviousClosePorts) :- !.
checkIfClose2(Lon,Lat,[Port|OtherPorts],PreviousClosePorts,Ports) :-
    port(Port,X,Y),
    harvesineDistance((Lon,Lat),(X,Y),Dist),
    (
    Dist < 5.0 ->
    ClosePort = [Port],
    !
    ;
    ClosePort = [],
    !
    ),
    append(ClosePort,PreviousClosePorts,NewPorts),
    checkIfClose2(Lon,Lat,OtherPorts,NewPorts,Ports).
