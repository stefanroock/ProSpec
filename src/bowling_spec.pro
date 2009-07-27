:- ensure_loaded('ProSpec.pro').
:- ensure_loaded('bowling.pro').

:- describe('Bowling'). 

generate_bowling_hits(_, 0).
generate_bowling_hits(Hit, Count) :- bowling_hit(Hit), Count2 is Count - 1, generate_bowling_hits(Hit, Count2).

:- dynamic(setup_spec/0).

setup_spec :- 
	retractall(bowling_hit_def(_)).

:- it('should score 0 for gutter game'/(
	generate_bowling_hits(0, 20),
	bowling_score(Score),
	assert_that(Score, equals:0)
)). 

:- it('should sum hits of a game'/(
	generate_bowling_hits(2, 20),
	bowling_score(Score),
	assert_that(Score, equals:40)
)). 

:- end_describe.

