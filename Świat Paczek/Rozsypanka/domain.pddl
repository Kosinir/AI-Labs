(define (domain blocks)
  (:requirements :adl)
  (:predicates
    (hand-empty)
    (holding ?x)
    (on-top ?x ?y) 
    (on-floor ?x)   
    (clear ?x)     
  )
  
  (:action podnies-z-paczki
    :parameters (?x ?y)
    :precondition (and (on-top ?x ?y) (clear ?x) (hand-empty))
    :effect (and (holding ?x) (clear ?y) (not (on-top ?x ?y)) (not(hand-empty)) )
  )

  (:action podnies-z-podlogi
    :parameters (?x)
    :precondition (and (on-floor ?x) (clear ?x) (hand-empty))
    :effect (and (holding ?x) (not (on-floor ?x)) (not (hand-empty)) )
  )

  (:action opusc-na-podloge
    :parameters (?x)
    :precondition (holding ?x)
    :effect (and (on-floor ?x) (clear ?x) (hand-empty) (not(holding ?x)) )
  )

  (:action opusc-na-paczke
    :parameters (?y ?x)
    :precondition (and (holding ?x) (clear ?y) (not (= ?x ?y)) )
    :effect (and (on-top ?x ?y) (clear ?x) (hand-empty) (not (holding ?x)) (not (clear ?y)))
  )
)