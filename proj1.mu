prop nota = not (<a1>tt\/<a2>tt\/<a3>tt\/<a4>tt)
prop nota2 = [a1]ff/\[a2]ff/\[a3]ff/\[a4]ff

prop a2_after_a1 = AG([a1]A (nota U <a2>tt))
prop a3_after_a2 = AG([a2]A (nota U <a3>tt))
prop a4_after_a3 = AG([a3]A (nota U <a4>tt))
prop a1_after_a4 = AG([a4]A (nota U <a1>tt))

prop a1_first = A (nota U <a1>tt)

prop cyclical = a1_first/\a2_after_a1/\a3_after_a2/\a4_after_a3/\a1_after_a4

prop b1_after_a1 = AG([a1]A([a1]ff U [b1]tt))
prop a1_after_b1 = AG([b1]A([b1]ff U [a1]tt))
prop b2_after_a2 = AG([a2]A([a2]ff U [b2]tt))
prop a2_after_b2 = AG([b2]A([b2]ff U [a2]tt))
prop b3_after_a3 = AG([a3]A([a3]ff U [b3]tt))
prop a3_after_b3 = AG([b3]A([b3]ff U [a3]tt))
prop b4_after_a4 = AG([a4]A([a4]ff U [b4]tt))
prop a4_after_b4 = AG([b4]A([b4]ff U [a4]tt))

prop alternate = a1_after_b1/\b1_after_a1/\a2_after_b2/\b2_after_a2/\a3_after_b3/\b3_after_a3/\a4_after_b4/\b4_after_a4

* recursive HML (mu-calculus) for the cyclical property
prop cyclical2 = a1f/\a2aa1/\a3aa2/\a4aa3/\a1aa4
prop a1f = min X = <a1>tt \/ (nota2 /\ [-]X /\ <->tt)
prop a2aa1 = max X = [a1] ( min Z = <a2>tt \/ (nota2 /\ [-]Z /\ <->tt)) /\ [-]X
prop a3aa2 = max X = [a2] ( min Z = <a3>tt \/ (nota2 /\ [-]Z /\ <->tt)) /\ [-]X
prop a4aa3 = max X = [a3] ( min Z = <a4>tt \/ (nota2 /\ [-]Z /\ <->tt)) /\ [-]X
prop a1aa4 = max X = [a4] ( min Z = <a1>tt \/ (nota2 /\ [-]Z /\ <->tt)) /\ [-]X

* prop alt2 = 
* 
* prop a1r = max X = [a1]tt ( min Z = ) /\ [-]X
* prop b1r = max X = [b1]tt ( min Z = ) /\ [-]X
