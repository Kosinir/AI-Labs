(define (domain piwnica-puzzle)
  (:requirements :strips :typing :negative-preconditions)
  (:types tile position room kolor kulkaid)

  (:predicates
    ;; Piwnica
    (kulka ?id - kulkaid ?color - kolor ?room - room)
    (drzwi ?from - room ?to - room ?color - kolor)
    (ludzik ?room - room)
    (trzymam ?color - kolor ?id - kulkaid)

    ;; 8-puzzle
    (at ?t - tile ?p - position)
    (empty ?p - position)
    (adjacent ?p1 - position ?p2 - position)
  )

  (:action wez
    :parameters (?color - kolor ?id - kulkaid ?room - room)
    :precondition (and
      (ludzik ?room)
      (kulka ?id ?color ?room)
      (not (trzymam ?color ?id))
    )
    :effect (and
      (not (kulka ?id ?color ?room))
      (trzymam ?color ?id)
    )
  )

  (:action idz
    :parameters (?to - room ?from - room ?color - kolor ?id - kulkaid)
    :precondition (and
      (ludzik ?from)
      (drzwi ?from ?to ?color)
      (trzymam ?color ?id)
    )
    :effect (and
      (not (ludzik ?from))
      (not (trzymam ?color ?id))
      (ludzik ?to)
    )
  )

  (:action przesun
    :parameters (?t - tile ?from - position ?to - position)
    :precondition (and
      (ludzik a)
      (at ?t ?from)
      (empty ?to)
      (adjacent ?from ?to)
    )
    :effect (and
      (not (at ?t ?from))
      (at ?t ?to)
      (not (empty ?to))
      (empty ?from)
    )
  )
)
