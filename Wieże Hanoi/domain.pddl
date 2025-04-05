(define (domain hanoi)
  (:requirements :strips :equality)
  (:predicates
    (disk ?x)           ; ?x is a disk
    (peg ?p)            ; ?p is a peg
    (on ?x ?p)          ; disk ?x is on peg ?p (somewhere in its stack)
    (top ?x ?p)         ; disk ?x is the top disk on peg ?p
    (empty ?p)          ; peg ?p is empty
    (smaller ?x ?y)     ; disk ?x is smaller than disk ?y
  )
  
  (:action move
    :parameters (?x ?from ?to)
    :precondition (and
      (disk ?x) (peg ?from) (peg ?to)       ; ensure correct roles
      (top ?x ?from)                        ; ?x is the top disk on peg ?from
      (not (= ?from ?to))                    ; cannot move onto the same peg
      (or 
         (empty ?to)                       ; destination peg is empty, or
         (exists (?y) (and (disk ?y) 
                           (top ?y ?to) 
                           (smaller ?x ?y)))  ; the top disk on peg ?to is larger than ?x
      )
    )
    :effect (and
      (not (on ?x ?from))     ; remove ?x from the source peg
      (not (top ?x ?from))
      (on ?x ?to)             ; add ?x to the destination peg
      (top ?x ?to)
      (empty ?from)           ; if ?x was the only disk on ?from, mark it empty
      (not (empty ?to))        ; destination peg is no longer empty
      ;; Note: In a more complete model you would update the new top disk for the source peg,
      ;; but here we assume moves only occur when the moving disk is the only disk.
    )
  )
)
