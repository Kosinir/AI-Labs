(define (problem piwnica-puzzle-instance)
  (:domain piwnica-puzzle)

  (:objects
    ;; Rooms
    a b c d e f g h i - room

    ;; Colors
    zielony czerwony pomaranczowy rozowy niebieski - kolor

    ;; Kulki
    k1 k2 k3 k4 k5 k6 k7 k8 k9 k10 k11 k12 k13 k14 - kulkaid

    ;; Puzzle tiles
    t1 t2 t3 t4 t5 t6 t7 t8 - tile
    p1 p2 p3 p4 p5 p6 p7 p8 p9 - position
  )

  (:init
    ;; Kulki locations
    (kulka k1 zielony a)
    (kulka k2 rozowy b)
    (kulka k3 pomaranczowy c)
    (kulka k4 niebieski c)
    (kulka k5 zielony d)
    (kulka k6 czerwony d)
    (kulka k7 niebieski e)
    (kulka k8 zielony e)
    (kulka k9 niebieski f)
    (kulka k10 niebieski f)
    (kulka k11 zielony h)
    (kulka k12 czerwony h)
    (kulka k13 pomaranczowy i)
    (kulka k14 niebieski i)

    ;; Doors
    (drzwi a b pomaranczowy)
    (drzwi a c czerwony)
    (drzwi c a czerwony)
    (drzwi b d pomaranczowy)
    (drzwi c e zielony)
    (drzwi e c zielony)
    (drzwi d f zielony)
    (drzwi f d zielony)
    (drzwi e f niebieski)
    (drzwi f e niebieski)
    (drzwi f g rozowy)
    (drzwi e h czerwony)
    (drzwi h e czerwony)
    (drzwi h i niebieski)
    (drzwi i h niebieski)
    (drzwi i f niebieski)
    (drzwi f i niebieski)

    ;; Ludzik start
    (ludzik f)

    ;; 8-puzzle init
    (at t5 p1)
    (at t4 p2)
    (at t1 p3)
    (at t8 p4)
    (empty p5)
    (at t3 p6)
    (at t7 p7)
    (at t2 p8)
    (at t6 p9)

    ;; Adjacency of 8-puzzle tiles
    (adjacent p1 p2) (adjacent p2 p1)
    (adjacent p2 p3) (adjacent p3 p2)
    (adjacent p1 p4) (adjacent p4 p1)
    (adjacent p2 p5) (adjacent p5 p2)
    (adjacent p3 p6) (adjacent p6 p3)
    (adjacent p4 p5) (adjacent p5 p4)
    (adjacent p5 p6) (adjacent p6 p5)
    (adjacent p4 p7) (adjacent p7 p4)
    (adjacent p5 p8) (adjacent p8 p5)
    (adjacent p6 p9) (adjacent p9 p6)
    (adjacent p7 p8) (adjacent p8 p7)
    (adjacent p8 p9) (adjacent p9 p8)
  )

  (:goal (and
    ;; Ludzik must reach room g
    (ludzik g)

    ;; 8-puzzle must be solved:
    ;; 1 2 3
    ;; 4 5 6
    ;; 7 8 _
    (at t1 p1)
    (at t2 p2)
    (at t3 p3)
    (at t4 p4)
    (at t5 p5)
    (at t6 p6)
    (at t7 p7)
    (at t8 p8)
    (empty p9)
  )
  )
)
