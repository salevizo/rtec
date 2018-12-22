initiatedAt(gap(_131135)=_131123, _131158, _131120, _131160) :-
     happensAtIE(gap_start(_131135),_131120),_131158=<_131120,_131120<_131160,
     happensAtIE(coord(_131135,_131152,_131153),_131120),_131158=<_131120,_131120<_131160,
     portDistance(_131152,_131153,_131123).

initiatedAt(stopped(_131135)=_131123, _131158, _131120, _131160) :-
     happensAtIE(stop_start(_131135),_131120),_131158=<_131120,_131120<_131160,
     happensAtIE(coord(_131135,_131152,_131153),_131120),_131158=<_131120,_131120<_131160,
     portDistance(_131152,_131153,_131123).

initiatedAt(lowSpeed(_131135)=true, _131151, _131120, _131153) :-
     happensAtIE(slow_motion_start(_131135),_131120),_131151=<_131120,_131120<_131153,
     \+ (happensAtIE(gap_start(_131135),_131120),_131151=<_131120,_131120<_131153).

initiatedAt(changingSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtIE(change_in_speed_start(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

initiatedAt(withinArea(_131135,_131136)=true, _131143, _131120, _131145) :-
     happensAtIE(entersArea(_131135,_131136),_131120),
     _131143=<_131120,
     _131120<_131145.

initiatedAt(underWay(_131135)=true, _131178, _131120, _131180) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131178=<_131120,_131120<_131180,
     \+ (happensAtIE(gap_start(_131135),_131120),_131178=<_131120,_131120<_131180),
     thresholds(underWayMin,_131162),
     thresholds(underWayMax,_131168),
     _131144>_131162,
     _131144<_131168.

initiatedAt(highSpeed(_131135)=true, _131174, _131120, _131176) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131174=<_131120,_131120<_131176,
     holdsAtProcessedSimpleFluent(_131135,withinArea(_131135,_131158)=true,_131120),
     areaType(_131158,nearCoast),
     thresholds(hcNearCoastMax,_131170),
     _131144>_131170.

initiatedAt(speedLTMin(_131135)=true, _131174, _131120, _131176) :-
     happensAtIE(coord(_131135,_131144,_131145),_131120),_131174=<_131120,_131120<_131176,
     happensAtIE(velocity(_131135,_131154,_131155,_131156),_131120),_131174=<_131120,_131120<_131176,
     vesselType(_131135,_131162),
     typeSpeed(_131162,_131168,_131169,_131170),
     _131154<_131168.

initiatedAt(adrift(_131135)=true, _131183, _131120, _131185) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131183=<_131120,_131120<_131185,
     _131146=\=511.0,
     holdsAtProcessedSimpleFluent(_131135,underWay(_131135)=true,_131120),
     absoluteAngleDiff(_131145,_131146,_131173),
     thresholds(adriftAngThr,_131179),
     _131173>_131179.

terminatedAt(gap(_131135)=_131123, _131141, _131120, _131143) :-
     happensAtIE(gap_end(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(stopped(_131135)=_131123, _131141, _131120, _131143) :-
     happensAtIE(stop_end(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(stopped(_131135)=_131123, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(lowSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtIE(slow_motion_end(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(lowSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(changingSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtIE(change_in_speed_end(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(changingSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(withinArea(_131135,_131136)=true, _131143, _131120, _131145) :-
     happensAtIE(leavesArea(_131135,_131136),_131120),
     _131143=<_131120,
     _131120<_131145.

terminatedAt(withinArea(_131135,_131136)=true, _131142, _131120, _131144) :-
     happensAtIE(gap_start(_131135),_131120),
     _131142=<_131120,
     _131120<_131144.

terminatedAt(underWay(_131135)=true, _131156, _131120, _131158) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131156=<_131120,_131120<_131158,
     thresholds(underWayMax,_131152),
     _131144>=_131152.

terminatedAt(underWay(_131135)=true, _131156, _131120, _131158) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131156=<_131120,_131120<_131158,
     thresholds(underWayMin,_131152),
     _131144=<_131152.

terminatedAt(underWay(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(highSpeed(_131135)=true, _131174, _131120, _131176) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131174=<_131120,_131120<_131176,
     holdsAtProcessedSimpleFluent(_131135,withinArea(_131135,_131158)=true,_131120),
     areaType(_131158,nearCoast),
     thresholds(hcNearCoastMax,_131170),
     _131144=<_131170.

terminatedAt(highSpeed(_131135)=true, _131153, _131120, _131155) :-
     happensAtProcessedSimpleFluent(_131135,end(withinArea(_131135,_131149)=true),_131120),_131153=<_131120,_131120<_131155,
     areaType(_131149,nearCoast).

terminatedAt(highSpeed(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(speedLTMin(_131135)=true, _131164, _131120, _131166) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131164=<_131120,_131120<_131166,
     vesselType(_131135,_131152),
     typeSpeed(_131152,_131158,_131159,_131160),
     _131144>=_131158.

terminatedAt(speedLTMin(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(adrift(_131135)=true, _131183, _131120, _131185) :-
     happensAtIE(velocity(_131135,_131144,_131145,_131146),_131120),_131183=<_131120,_131120<_131185,
     _131146=\=511.0,
     holdsAtProcessedSimpleFluent(_131135,underWay(_131135)=true,_131120),
     absoluteAngleDiff(_131145,_131146,_131173),
     thresholds(adriftAngThr,_131179),
     _131173<_131179.

terminatedAt(adrift(_131135)=true, _131141, _131120, _131143) :-
     happensAtProcessed(_131135,gap_init(_131135),_131120),
     _131141=<_131120,
     _131120<_131143.

terminatedAt(adrift(_131135)=true, _131146, _131120, _131148) :-
     happensAtProcessedSimpleFluent(_131135,end(underWay(_131135)=true),_131120),
     _131146=<_131120,
     _131120<_131148.

holdsForSDFluent(atAnchorOrMoored(_131135)=true,_131120) :-
     holdsForProcessedSimpleFluent(_131135,stopped(_131135)=farFromPorts,_131141),
     holdsForProcessedSimpleFluent(_131135,withinArea(_131135,_131158)=true,_131152),
     areaType(_131158,anchorage),
     intersect_all([_131141,_131152],_131170),
     holdsForProcessedSimpleFluent(_131135,stopped(_131135)=nearPort,_131180),
     union_all([_131170,_131180],_131191),
     thresholds(aOrMTime,_131201),
     intDurGreater(_131191,_131201,_131120).

holdsForSDFluent(maa(_131135)=true,_131120) :-
     holdsForProcessedSimpleFluent(_131135,speedLTMin(_131135)=true,_131141),
     holdsForProcessedSDFluent(_131135,atAnchorOrMoored(_131135)=true,_131152),
     holdsForProcessedSimpleFluent(_131135,withinArea(_131135,_131169)=true,_131163),
     areaType(_131169,nearCoast),
     relative_complement_all(_131141,[_131152,_131163],_131182),
     thresholds(maaTime,_131192),
     intDurGreater(_131182,_131192,_131120).

holdsForSDFluent(rendezVous(_131135,_131136)=true,_131120) :-
     holdsForProcessedIE(_131135,proximity(_131135,_131136)=true,_131142),
     \+vesselType(_131135,tug),
     \+vesselType(_131136,tug),
     \+vesselType(_131135,pilotvessel),
     \+vesselType(_131136,pilotvessel),
     holdsForProcessedSimpleFluent(_131135,lowSpeed(_131135)=true,_131186),
     holdsForProcessedSimpleFluent(_131136,lowSpeed(_131136)=true,_131197),
     holdsForProcessedSimpleFluent(_131135,stopped(_131135)=farFromPorts,_131208),
     holdsForProcessedSimpleFluent(_131136,stopped(_131136)=farFromPorts,_131219),
     withinAreaType(_131135,nearCoast,_131231),
     withinAreaType(_131136,nearCoast,_131238),
     union_all([_131186,_131208],_131244),
     union_all([_131197,_131219],_131254),
     relative_complement_all(_131244,[_131231],_131265),
     relative_complement_all(_131254,[_131238],_131274),
     intersect_all([_131265,_131274,_131142],_131282),
     thresholds(rendezvousTime,_131294),
     intDurGreater(_131282,_131294,_131120).

happensAtEv(gap_init(_131129),_131120) :-
     happensAtProcessedSimpleFluent(_131129,start(gap(_131129)=nearPort),_131120).

happensAtEv(gap_init(_131129),_131120) :-
     happensAtProcessedSimpleFluent(_131129,start(gap(_131129)=farFromPorts),_131120).

cachingOrder2(_131119, gap(_131119)=nearPort) :-
     vessel(_131119),portStatus(nearPort).

cachingOrder2(_131119, gap(_131119)=farFromPorts) :-
     vessel(_131119),portStatus(farFromPorts).

cachingOrder2(_131116, gap_init(_131116)) :-
     vessel(_131116).

cachingOrder2(_131119, stopped(_131119)=nearPort) :-
     vessel(_131119),portStatus(nearPort).

cachingOrder2(_131119, stopped(_131119)=farFromPorts) :-
     vessel(_131119),portStatus(farFromPorts).

cachingOrder2(_131119, lowSpeed(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, changingSpeed(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, withinArea(_131119,_131120)=true) :-
     vessel(_131119).

cachingOrder2(_131119, underWay(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, highSpeed(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, atAnchorOrMoored(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, adrift(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, speedLTMin(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, maa(_131119)=true) :-
     vessel(_131119).

cachingOrder2(_131119, rendezVous(_131119,_131120)=true) :-
     vpair(_131119,_131120).

collectIntervals2(_131119, proximity(_131119,_131120)=true) :-
     vpair(_131119,_131120).

