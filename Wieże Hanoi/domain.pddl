(define
    (domain wieze)
    (:requirements :adl :equality)
    (:predicates
        (palik ?x)
        (mniejszy ?x ?y)
        (napaliku ?x ?y)
    )
    (:action przesun-na-pusty
        :parameters (?x ?y ?z)
        :precondition
        (and
            (palik ?x)
            (palik ?y)
            (napaliku ?x ?z)
            (not (= ?x ?y))
            (not (exists (?p) (and(mniejszy ?p ?z)(napaliku ?x ?p))))
            (not (exists (?p) (napaliku ?y ?p)))
        )
        :effect
        (and
            (not (napaliku ?x ?z))
            (napaliku ?y ?z)
        )
    )
    (:action przesun
        :parameters (?x ?y ?z)
        :precondition
        (and
            (palik ?x)
            (palik ?y)
            (napaliku ?x ?z)
            (not (= ?x ?y))
            (not (exists (?p) (and(mniejszy ?p ?z)(napaliku ?x ?p))))
            (not (exists (?p) (and(mniejszy ?p ?z)(napaliku ?y ?p))))
        )
        :effect
        (and
            (not (napaliku ?x ?z))
            (napaliku ?y ?z)
        )
    )
)

