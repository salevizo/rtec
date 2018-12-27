initiatedAt(gap(_131139)=_131127, _131162, _131124, _131164) :-
     happensAtIE(gap_start(_131139),_131124),_131162=<_131124,_131124<_131164,
     happensAtIE(coord(_131139,_131156,_131157),_131124),_131162=<_131124,_131124<_131164,
     portDistance(_131156,_131157,_131127).

initiatedAt(stopped(_131139)=_131127, _131162, _131124, _131164) :-
     happensAtIE(stop_start(_131139),_131124),_131162=<_131124,_131124<_131164,
     happensAtIE(coord(_131139,_131156,_131157),_131124),_131162=<_131124,_131124<_131164,
     portDistance(_131156,_131157,_131127).

initiatedAt(lowSpeed(_131139)=true, _131155, _131124, _131157) :-
     happensAtIE(slow_motion_start(_131139),_131124),_131155=<_131124,_131124<_131157,
     \+ (happensAtIE(gap_start(_131139),_131124),_131155=<_131124,_131124<_131157).

initiatedAt(changingSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtIE(change_in_speed_start(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

initiatedAt(withinArea(_131139,_131140)=true, _131147, _131124, _131149) :-
     happensAtIE(entersArea(_131139,_131140),_131124),
     _131147=<_131124,
     _131124<_131149.

initiatedAt(underWay(_131139)=true, _131182, _131124, _131184) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131182=<_131124,_131124<_131184,
     \+ (happensAtIE(gap_start(_131139),_131124),_131182=<_131124,_131124<_131184),
     thresholds(underWayMin,_131166),
     thresholds(underWayMax,_131172),
     _131148>_131166,
     _131148<_131172.

initiatedAt(highSpeed(_131139)=true, _131178, _131124, _131180) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131178=<_131124,_131124<_131180,
     holdsAtProcessedSimpleFluent(_131139,withinArea(_131139,_131162)=true,_131124),
     areaType(_131162,nearCoast),
     thresholds(hcNearCoastMax,_131174),
     _131148>_131174.

initiatedAt(speedLTMin(_131139)=true, _131178, _131124, _131180) :-
     happensAtIE(coord(_131139,_131148,_131149),_131124),_131178=<_131124,_131124<_131180,
     happensAtIE(velocity(_131139,_131158,_131159,_131160),_131124),_131178=<_131124,_131124<_131180,
     vesselType(_131139,_131166),
     typeSpeed(_131166,_131172,_131173,_131174),
     _131158<_131172.

initiatedAt(adrift(_131139)=true, _131187, _131124, _131189) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131187=<_131124,_131124<_131189,
     _131150=\=511.0,
     holdsAtProcessedSimpleFluent(_131139,underWay(_131139)=true,_131124),
     absoluteAngleDiff(_131149,_131150,_131177),
     thresholds(adriftAngThr,_131183),
     _131177>_131183.

terminatedAt(gap(_131139)=_131127, _131145, _131124, _131147) :-
     happensAtIE(gap_end(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(stopped(_131139)=_131127, _131145, _131124, _131147) :-
     happensAtIE(stop_end(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(stopped(_131139)=_131127, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(lowSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtIE(slow_motion_end(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(lowSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(changingSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtIE(change_in_speed_end(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(changingSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(withinArea(_131139,_131140)=true, _131147, _131124, _131149) :-
     happensAtIE(leavesArea(_131139,_131140),_131124),
     _131147=<_131124,
     _131124<_131149.

terminatedAt(withinArea(_131139,_131140)=true, _131146, _131124, _131148) :-
     happensAtIE(gap_start(_131139),_131124),
     _131146=<_131124,
     _131124<_131148.

terminatedAt(underWay(_131139)=true, _131160, _131124, _131162) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131160=<_131124,_131124<_131162,
     thresholds(underWayMax,_131156),
     _131148>=_131156.

terminatedAt(underWay(_131139)=true, _131160, _131124, _131162) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131160=<_131124,_131124<_131162,
     thresholds(underWayMin,_131156),
     _131148=<_131156.

terminatedAt(underWay(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(highSpeed(_131139)=true, _131178, _131124, _131180) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131178=<_131124,_131124<_131180,
     holdsAtProcessedSimpleFluent(_131139,withinArea(_131139,_131162)=true,_131124),
     areaType(_131162,nearCoast),
     thresholds(hcNearCoastMax,_131174),
     _131148=<_131174.

terminatedAt(highSpeed(_131139)=true, _131157, _131124, _131159) :-
     happensAtProcessedSimpleFluent(_131139,end(withinArea(_131139,_131153)=true),_131124),_131157=<_131124,_131124<_131159,
     areaType(_131153,nearCoast).

terminatedAt(highSpeed(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(speedLTMin(_131139)=true, _131168, _131124, _131170) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131168=<_131124,_131124<_131170,
     vesselType(_131139,_131156),
     typeSpeed(_131156,_131162,_131163,_131164),
     _131148>=_131162.

terminatedAt(speedLTMin(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(adrift(_131139)=true, _131187, _131124, _131189) :-
     happensAtIE(velocity(_131139,_131148,_131149,_131150),_131124),_131187=<_131124,_131124<_131189,
     _131150=\=511.0,
     holdsAtProcessedSimpleFluent(_131139,underWay(_131139)=true,_131124),
     absoluteAngleDiff(_131149,_131150,_131177),
     thresholds(adriftAngThr,_131183),
     _131177<_131183.

terminatedAt(adrift(_131139)=true, _131145, _131124, _131147) :-
     happensAtProcessed(_131139,gap_init(_131139),_131124),
     _131145=<_131124,
     _131124<_131147.

terminatedAt(adrift(_131139)=true, _131150, _131124, _131152) :-
     happensAtProcessedSimpleFluent(_131139,end(underWay(_131139)=true),_131124),
     _131150=<_131124,
     _131124<_131152.

holdsForSDFluent(atAnchorOrMoored(_131139)=true,_131124) :-
     holdsForProcessedSimpleFluent(_131139,stopped(_131139)=farFromPorts,_131145),
     holdsForProcessedSimpleFluent(_131139,withinArea(_131139,_131162)=true,_131156),
     areaType(_131162,anchorage),
     intersect_all([_131145,_131156],_131174),
     holdsForProcessedSimpleFluent(_131139,stopped(_131139)=nearPort,_131184),
     union_all([_131174,_131184],_131195),
     thresholds(aOrMTime,_131205),
     intDurGreater(_131195,_131205,_131124).

holdsForSDFluent(maa(_131139)=true,_131124) :-
     holdsForProcessedSimpleFluent(_131139,speedLTMin(_131139)=true,_131145),
     holdsForProcessedSDFluent(_131139,atAnchorOrMoored(_131139)=true,_131156),
     holdsForProcessedSimpleFluent(_131139,withinArea(_131139,_131173)=true,_131167),
     areaType(_131173,nearCoast),
     relative_complement_all(_131145,[_131156,_131167],_131186),
     thresholds(maaTime,_131196),
     intDurGreater(_131186,_131196,_131124).

holdsForSDFluent(rendezVous(_131139,_131140)=true,_131124) :-
     holdsForProcessedIE(_131139,proximity(_131139,_131140)=true,_131146),
     \+vesselType(_131139,tug),
     \+vesselType(_131140,tug),
     \+vesselType(_131139,pilotvessel),
     \+vesselType(_131140,pilotvessel),
     holdsForProcessedSimpleFluent(_131139,lowSpeed(_131139)=true,_131190),
     holdsForProcessedSimpleFluent(_131140,lowSpeed(_131140)=true,_131201),
     holdsForProcessedSimpleFluent(_131139,stopped(_131139)=farFromPorts,_131212),
     holdsForProcessedSimpleFluent(_131140,stopped(_131140)=farFromPorts,_131223),
     withinAreaType(_131139,nearCoast,_131235),
     withinAreaType(_131140,nearCoast,_131242),
     union_all([_131190,_131212],_131248),
     union_all([_131201,_131223],_131258),
     relative_complement_all(_131248,[_131235],_131269),
     relative_complement_all(_131258,[_131242],_131278),
     intersect_all([_131269,_131278,_131146],_131286),
     thresholds(rendezvousTime,_131298),
     intDurGreater(_131286,_131298,_131124).

happensAtEv(gap_init(_131133),_131124) :-
     happensAtProcessedSimpleFluent(_131133,start(gap(_131133)=nearPort),_131124).

happensAtEv(gap_init(_131133),_131124) :-
     happensAtProcessedSimpleFluent(_131133,start(gap(_131133)=farFromPorts),_131124).

cachingOrder2(_131123, gap(_131123)=nearPort) :-
     vessel(_131123),portStatus(nearPort).

cachingOrder2(_131123, gap(_131123)=farFromPorts) :-
     vessel(_131123),portStatus(farFromPorts).

cachingOrder2(_131120, gap_init(_131120)) :-
     vessel(_131120).

cachingOrder2(_131123, stopped(_131123)=nearPort) :-
     vessel(_131123),portStatus(nearPort).

cachingOrder2(_131123, stopped(_131123)=farFromPorts) :-
     vessel(_131123),portStatus(farFromPorts).

cachingOrder2(_131123, lowSpeed(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, changingSpeed(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, withinArea(_131123,_131124)=true) :-
     vessel(_131123).

cachingOrder2(_131123, underWay(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, highSpeed(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, atAnchorOrMoored(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, adrift(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, speedLTMin(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, maa(_131123)=true) :-
     vessel(_131123).

cachingOrder2(_131123, rendezVous(_131123,_131124)=true) :-
     vpair(_131123,_131124).

collectIntervals2(_131123, proximity(_131123,_131124)=true) :-
     vpair(_131123,_131124).

