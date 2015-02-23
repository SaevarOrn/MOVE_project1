* solved := [W|W|W|E|B|B|B]
prop solved = <w1>tt /\ <w2>tt /\ <w3>tt /\ <b5>tt /\ <b6>tt /\ <b7>tt

* is_solvable := EF (solved)
prop is_solvable = min X = solved \/ <->X
