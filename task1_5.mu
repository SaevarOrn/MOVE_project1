* ***** .MU FILE FOR N=5 *****
* 5555555555555555555555555555
* ****************************

* *** HML Properties ***

* nota_hml := no a move is possible

prop nota_hml = [a1]ff/\[a2]ff/\[a3]ff/\[a4]ff/\[a5]ff

* cyclical_hml := the scheduler is cyclical (a1, a2, a3, etc not a1, a3, a2)

prop cyclical_hml = a1f/\a2aa1/\a3aa2/\a4aa3/\a5aa4/\a1aa5

* a1f := a1 starts (a1 first)
prop a1f = min X = <a1>tt \/ (nota_hml /\ [-]X /\ <->tt)

* aiaaj := ai happens after aj (not ai UNTIL aj)
prop a2aa1 = max X = [a1] ( min Z = <a2>tt \/ (nota_hml /\ [-]Z /\ <->tt)) /\ [-]X
prop a3aa2 = max X = [a2] ( min Z = <a3>tt \/ (nota_hml /\ [-]Z /\ <->tt)) /\ [-]X
prop a4aa3 = max X = [a3] ( min Z = <a4>tt \/ (nota_hml /\ [-]Z /\ <->tt)) /\ [-]X
prop a5aa4 = max X = [a4] ( min Z = <a5>tt \/ (nota_hml /\ [-]Z /\ <->tt)) /\ [-]X
prop a1aa5 = max X = [a5] ( min Z = <a1>tt \/ (nota_hml /\ [-]Z /\ <->tt)) /\ [-]X

* alt2 := each cell alternates on ai and bi

prop alt2 = a1r/\b1r/\a2r/\b2r/\a3r/\b3r/\a4r/\b4r

* Xir = Xi cannot happen until Yi happens, where X,Y are in {a,b}
prop a1r = max X = [a1] ( min Z = <b1>tt \/ ([a1]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop b1r = max X = [b1] ( min Z = <a1>tt \/ ([b1]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop a2r = max X = [a2] ( min Z = <b2>tt \/ ([a2]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop b2r = max X = [b2] ( min Z = <a2>tt \/ ([b2]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop a3r = max X = [a3] ( min Z = <b3>tt \/ ([a3]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop b3r = max X = [b3] ( min Z = <a3>tt \/ ([b3]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop a4r = max X = [a4] ( min Z = <b4>tt \/ ([a4]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop b4r = max X = [b4] ( min Z = <a4>tt \/ ([b4]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop a5r = max X = [a5] ( min Z = <b5>tt \/ ([a5]ff /\ [-]Z /\ <->tt) ) /\ [-]X
prop b5r = max X = [b5] ( min Z = <a5>tt \/ ([b5]ff /\ [-]Z /\ <->tt) ) /\ [-]X

* *** CTL Properties *** 

prop nota_ctl = not (<a1>tt\/<a2>tt\/<a3>tt\/<a4>tt)

prop a2_after_a1 = AG([a1]A (nota_ctl U <a2>tt))
prop a3_after_a2 = AG([a2]A (nota_ctl U <a3>tt))
prop a4_after_a3 = AG([a3]A (nota_ctl U <a4>tt))
prop a5_after_a4 = AG([a4]A (nota_ctl U <a5>tt))
prop a1_after_a5 = AG([a5]A (nota_ctl U <a1>tt))

prop a1_first = A (nota_ctl U <a1>tt)

prop cyclical_ctl = a1_first/\a2_after_a1/\a3_after_a2/\a4_after_a3/\a5_after_a4/\a1_after_a5

prop b1_after_a1 = AG([a1]A([a1]ff U <b1>tt))
prop a1_after_b1 = AG([b1]A([b1]ff U <a1>tt))
prop b2_after_a2 = AG([a2]A([a2]ff U <b2>tt))
prop a2_after_b2 = AG([b2]A([b2]ff U <a2>tt))
prop b3_after_a3 = AG([a3]A([a3]ff U <b3>tt))
prop a3_after_b3 = AG([b3]A([b3]ff U <a3>tt))
prop b4_after_a4 = AG([a4]A([a4]ff U <b4>tt))
prop a4_after_b4 = AG([b4]A([b4]ff U <a4>tt))
prop b5_after_a5 = AG([a5]A([a5]ff U <b5>tt))
prop a5_after_b5 = AG([b5]A([b5]ff U <a5>tt))

* the following lines are split for readability
prop a_after_b = a1_after_b1/\a2_after_b2/\a3_after_b3/\a4_after_b4/\a5_after_b5
prop b_after_a = b1_after_a1/\b2_after_a2/\b3_after_a3/\b4_after_a4/\b5_after_a5

* ai must follow bi and bi must follow ai
prop alternate = a_after_b/\b_after_a

