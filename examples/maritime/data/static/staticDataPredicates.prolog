
areaType(Area,Type):-bigAreaType(Area,Type).

vesselType(Vessel,Type):-     vesselStaticInfo(Vessel,Type,_Draft).
draft(Vessel,Draft):-     vesselStaticInfo(Vessel,_Type,Draft).

%getDepthFeatures(XStart,YStart,XStep,YStep) 
getDepthFeatures(-10.001953125,45.000277149,0.004394531,0.004394531).


findDepth(Lon0,Lat0,Depth):-
	getDepthFeatures(XStart,YStart,XStep,YStep),
	% note that we first need to convert to integers,
	% since mod does not work with floats here
	% (assumption: Lon/Lat have at most 6 decimal digits)
	format(atom(FLon),'~9f', Lon0), atom_number(FLon, Lon), format(atom(FLat),'~9f', Lat0), atom_number(FLat, Lat),
	MU is 1000000000,
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
	depth((LowLeftX,LowLeftY),Depth),!.

