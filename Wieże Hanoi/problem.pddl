(define (problem hanoi-5)
  (:domain hanoi)
  (:objects 
    k1 k2 k3 k4 k5  ; disks
    x y z          ; pegs
  )
  (:init
    (disk k1) (disk k2) (disk k3) (disk k4) (disk k5)
    (peg x) (peg y) (peg z)
    ;; Initial state: all disks are on peg x.
    ;; We represent the full stack as follows:
    (on k5 x)  ; the largest disk is directly on peg x
    (on k4 x)
    (on k3 x)
    (on k2 x)
    (on k1 x)
    ;; The top disk on peg x is k1.
    (top k1 x)
    ;; Pegs y and z are empty.
    (empty y)
    (empty z)
    ;; Size relationships: k1 is the smallest, then k2, and so on.
    (smaller k1 k2)
    (smaller k2 k3)
    (smaller k3 k4)
    (smaller k4 k5)
  )
  (:goal (and
    ;; Goal: All disks should be on peg z in the same stack order.
    (on k5 z)
    (on k4 z)
    (on k3 z)
    (on k2 z)
    (on k1 z)
  ))
)
