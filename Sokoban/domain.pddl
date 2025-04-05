(define (domain sokoban)
  (:requirements :strips :equality :disjunctive-preconditions :negative-preconditions)
  
  (:predicates
    (robot ?x)
    (paczka ?x)
    (cel ?x)
    (poziomo ?x ?y)
    (pionowo ?x ?y)
  )
  
  (:action idz
    :parameters (?x ?y)
    :precondition (and (robot ?x) (or (poziomo ?x ?y) (pionowo ?x ?y)) (not (paczka ?y))) ; robot jest na X, może poruszać się pionowo/poziomo, jeśli nie ma tam paczki 
    :effect (and (robot ?y) (not (robot ?x))) ; efektem jest że robot przemieszcza się na Y i znika z X
  )
  
  (:action pchaj
    :parameters (?x ?y ?z)
    :precondition (and
      (or (and (poziomo ?x ?y) (poziomo ?y ?z)) (and (pionowo ?x ?y) (pionowo ?y ?z)))
      (not (= ?x ?y))
      (not (= ?y ?z))
      (not (= ?x ?z))
      (robot ?x)
      (not (paczka ?x))
      (paczka ?y)
      (not (paczka ?z))
    )
    :effect (and
      (robot ?y)
      (not (robot ?x))
      (paczka ?z)
      (not (paczka ?y))
    )
  )
)