:- ensure_loaded('ProSpec.pro').

:- describe('ProSpec'). 

:- dynamic(setup_spec/0).

setup_spec :- 
	retractall(get_value(_)),
	assert(get_value(X):-X).

:- it('asserts that a predicate is true'/(
	assert_that(get_value(true), is_true),
	not(assert_that(get_value(false), is_true))
)). 

:- it('asserts that a predicate is false'/(
	assert_that(get_value(false), is_false),
	not(assert_that(get_value(true), is_false))
)). 

:- it('asserts that a predicate fails'/(
	assert_that(get_value(false), fails),
	not(assert_that(get_value(true), fails))
)). 

:- it('asserts that a list is empty'/(
	assert_that([], is_empty),
	not(assert_that([a], is_empty))
)). 

:- it('asserts that a list has a member'/(
	assert_that([a,b,c], has_member:b),
	not(assert_that([], has_member:a))
)). 

:- it('asserts that a list misses a member'/(
	assert_that([a,c], has_no_member:b),
	not(assert_that([a], has_no_member:a))
)). 

:- it('asserts that a list contains all members of another list'/(
	assert_that([a,b,c], contains_all:[b,c]),
	not(assert_that([a,b], contains_all:[a,c]))
)). 

:- end_describe.

