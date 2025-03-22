(define (problem p1)
    (:domain blocks)
    (:objects
        a b c d e
    )
    (:init
        (clear c)
        (on-top c b)
        (on-top b a)
        (on-floor a)
        (clear e)
        (on-top e d)
        (on-floor d)
        (hand-empty)
    )
    (:goal (forall (?x) (on-floor ?x)))
)