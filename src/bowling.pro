bowling_hit(Count) :- assert(bowling_hit_def(Count)).

bowling_score(Score) :- 
	findall(Hit, bowling_hit_def(Hit), Hits),
	sumlist(Hits, Score).
	
