#lang racket 

(require racket/gui rsound)

(define (determine-note-on-click event)
  (define dc (send keys get-dc))
  (send dc set-brush "gray" 'solid)
  (cond 
    ;; White Keys
    ((or (and (< (send event get-x) 80) (< (send event get-y) 160)) 
         (and (< (send event get-x) 100) (>= (send event get-y) 160))) 
     (begin (play (make-tone 261.63 0.5 20000))
            (send msg set-label "C")
            (send dc draw-polygon (list (cons 0 0) (cons 80 0) (cons 80 160) (cons 100 160) (cons 100 300) (cons 0 300))))) ; play C
    ((or (and (> (send event get-x) 120) (< (send event get-x) 180) (< (send event get-y) 160)) 
         (and (> (send event get-x) 100) (< (send event get-x) 200) (>= (send event get-y) 160))) 
     (begin (play (make-tone 293.66 0.5 20000))
            (send msg set-label "D")
            (send dc draw-polygon (list (cons 120 0) (cons 180 0) (cons 180 160) (cons 200 160) (cons 200 300) (cons 100 300) (cons 100 160) (cons 120 160))))) ; play D
    ((or (and (> (send event get-x) 220) (< (send event get-x) 300) (< (send event get-y) 160)) 
         (and (> (send event get-x) 200) (< (send event get-x) 300) (>= (send event get-y) 160))) 
     (begin (play (make-tone 329.63 0.5 20000))
            (send msg set-label "E")
            (send dc draw-polygon (list (cons 220 0) (cons 300 0) (cons 300 300) (cons 200 300) (cons 200 160) (cons 220 160))))) ; play E
    ((or (and (> (send event get-x) 300) (< (send event get-x) 380) (< (send event get-y) 160)) 
         (and (> (send event get-x) 300) (< (send event get-x) 400) (>= (send event get-y) 160))) 
     (begin (play (make-tone 349.23 0.5 20000))
            (send msg set-label "F")
            (send dc draw-polygon (list (cons 300 0) (cons 380 0) (cons 380 160) (cons 400 160) (cons 400 300) (cons 300 300))))) ; play F
    ((or (and (> (send event get-x) 420) (< (send event get-x) 480) (< (send event get-y) 160)) 
         (and (> (send event get-x) 400) (< (send event get-x) 500) (>= (send event get-y) 160))) 
     (begin (play (make-tone 392.00 0.5 20000))
            (send msg set-label "G")
            (send dc draw-polygon (list (cons 420 0) (cons 480 0) (cons 480 160) (cons 500 160) (cons 500 300) (cons 400 300) (cons 400 160) (cons 420 160))))) ; play G
    ((or (and (> (send event get-x) 520) (< (send event get-x) 580) (< (send event get-y) 160)) 
         (and (> (send event get-x) 500) (< (send event get-x) 600) (>= (send event get-y) 160))) 
     (begin (play (make-tone 440.00 0.5 20000))
            (send msg set-label "A")
            (send dc draw-polygon (list (cons 520 0) (cons 580 0) (cons 580 160) (cons 600 160) (cons 600 300) (cons 500 300) (cons 500 160) (cons 520 160))))) ; play A
    ((or (and (> (send event get-x) 620) (< (send event get-x) 700) (< (send event get-y) 160)) 
         (and (> (send event get-x) 600) (< (send event get-x) 700) (>= (send event get-y) 160))) 
     (begin (play (make-tone 493.88 0.5 20000))
            (send msg set-label "B")
            (send dc draw-polygon (list (cons 620 0) (cons 700 0) (cons 700 300) (cons 600 300) (cons 600 160) (cons 620 160))))) ; play B
    ((or (and (> (send event get-x) 700) (< (send event get-x) 780) (< (send event get-y) 160)) 
             (and (> (send event get-x) 700) (>= (send event get-y) 160))) 
     (begin (play (make-tone 523.25 0.5 20000))
            (send msg set-label "C")
            (send dc draw-polygon (list (cons 700 0) (cons 780 0) (cons 780 160) (cons 800 160) (cons 800 300) (cons 700 300))))) ; play C
    
    ;; Black Keys
    ((and (> (send event get-x) 80) (< (send event get-x) 120) (< (send event get-y) 160)) 
     (begin (play (make-tone 277.18 0.5 20000))
            (send msg set-label "C#")
            (send dc draw-rectangle 80 0 40 160))) ; play C#
    ((and (> (send event get-x) 180) (< (send event get-x) 220) (< (send event get-y) 160)) 
     (begin (play (make-tone 311.13 0.5 20000))
            (send msg set-label "D#")
            (send dc draw-rectangle 180 0 40 160))) ; play D#
    ((and (> (send event get-x) 380) (< (send event get-x) 420) (< (send event get-y) 160)) 
     (begin (play (make-tone 369.99 0.5 20000))
            (send msg set-label "F#")
            (send dc draw-rectangle 380 0 40 160))) ; play F#
    ((and (> (send event get-x) 480) (< (send event get-x) 520) (< (send event get-y) 160)) 
     (begin (play (make-tone 415.30 0.5 20000))
            (send msg set-label "G#")
            (send dc draw-rectangle 480 0 40 160))) ; play G#
    ((and (> (send event get-x) 580) (< (send event get-x) 620) (< (send event get-y) 160)) 
     (begin (play (make-tone 466.16 0.5 20000))
            (send msg set-label "A#")
            (send dc draw-rectangle 580 0 40 160))) ; play A#
    ((and (> (send event get-x) 780) (< (send event get-y) 160)) 
     (begin (play (make-tone 554.37 0.5 20000))
            (send msg set-label "C#")
            (send dc draw-rectangle 780 0 40 160))) ; play C#
    ))

(define (determine-note-on-keyboard event)
  (define dc (send keys get-dc))
  (send dc set-brush "gray" 'solid)
  (cond ;; White Keys
    ((eqv? (send event get-key-code) #\a) 
     (begin (play (make-tone 261.63 0.5 20000))(send msg set-label "C")
            (send dc draw-polygon (list (cons 0 0) (cons 80 0) (cons 80 160) (cons 100 160) (cons 100 300) (cons 0 300))))) ;; Play C
    ((eqv? (send event get-key-code) #\s) 
     (begin (play (make-tone 293.66 0.5 20000))(send msg set-label "D")
            (send dc draw-polygon (list (cons 120 0) (cons 180 0) (cons 180 160) (cons 200 160) (cons 200 300) (cons 100 300) (cons 100 160) (cons 120 160))))) ;; Play D
    ((eqv? (send event get-key-code) #\d) 
     (begin (play (make-tone 329.63 0.5 20000))(send msg set-label "E")
            (send dc draw-polygon (list (cons 220 0) (cons 300 0) (cons 300 300) (cons 200 300) (cons 200 160) (cons 220 160))))) ;; Play E
    ((eqv? (send event get-key-code) #\f) 
     (begin (play (make-tone 349.23 0.5 20000))(send msg set-label "F")
            (send dc draw-polygon (list (cons 300 0) (cons 380 0) (cons 380 160) (cons 400 160) (cons 400 300) (cons 300 300))))) ;; Play F
    ((eqv? (send event get-key-code) #\j) 
     (begin (play (make-tone 392.00 0.5 20000))(send msg set-label "G")
            (send dc draw-polygon (list (cons 420 0) (cons 480 0) (cons 480 160) (cons 500 160) (cons 500 300) (cons 400 300) (cons 400 160) (cons 420 160))))) ;; Play G
    ((eqv? (send event get-key-code) #\k) 
     (begin (play (make-tone 440.00 0.5 20000))(send msg set-label "A")
            (send dc draw-polygon (list (cons 520 0) (cons 580 0) (cons 580 160) (cons 600 160) (cons 600 300) (cons 500 300) (cons 500 160) (cons 520 160))))) ;; Play A
    ((eqv? (send event get-key-code) #\l) 
     (begin (play (make-tone 493.88 0.5 20000))(send msg set-label "B")
            (send dc draw-polygon (list (cons 620 0) (cons 700 0) (cons 700 300) (cons 600 300) (cons 600 160) (cons 620 160))))) ;; Play B
    ((eqv? (send event get-key-code) #\;) 
     (begin (play (make-tone 523.25 0.5 20000))(send msg set-label "C")
            (send dc draw-polygon (list (cons 700 0) (cons 780 0) (cons 780 160) (cons 800 160) (cons 800 300) (cons 700 300))))) ;; Play C
    ;; Black Keys
    ((eqv? (send event get-key-code) #\w) 
     (begin (play (make-tone 277.18 0.5 20000)) (send msg set-label "C#") (send dc draw-rectangle 80 0 40 160))) ;; Play C#
    ((eqv? (send event get-key-code) #\e) 
     (begin (play (make-tone 311.13 0.5 20000)) (send msg set-label "D#") (send dc draw-rectangle 180 0 40 160))) ;; Play D#
    ((eqv? (send event get-key-code) #\y) 
     (begin (play (make-tone 369.99 0.5 20000)) (send msg set-label "F#") (send dc draw-rectangle 380 0 40 160))) ;; Play F#
    ((eqv? (send event get-key-code) #\u) 
     (begin (play (make-tone 415.30 0.5 20000)) (send msg set-label "G#") (send dc draw-rectangle 480 0 40 160))) ;; Play G#
    ((eqv? (send event get-key-code) #\i) 
     (begin (play (make-tone 466.16 0.5 20000)) (send msg set-label "A#") (send dc draw-rectangle 580 0 40 160))) ;; Play A#
    ((eqv? (send event get-key-code) #\[) 
     (begin (play (make-tone 554.37 0.5 20000)) (send msg set-label "C#") (send dc draw-rectangle 780 0 40 160))) ;; Play C#
        ))

(define (draw-keyboard dc)
  (send dc draw-line 100 0 100 500)
  (send dc draw-line 200 0 200 500)
  (send dc draw-line 300 0 300 500)
  (send dc draw-line 400 0 400 500)
  (send dc draw-line 500 0 500 500)
  (send dc draw-line 600 0 600 500)
  (send dc draw-line 700 0 700 500)
  
  (send dc set-brush "black" 'solid)
  
  (send dc draw-rectangle 80 0 40 160)
  (send dc draw-rectangle 180 0 40 160)
  (send dc draw-rectangle 380 0 40 160)
  (send dc draw-rectangle 480 0 40 160)
  (send dc draw-rectangle 580 0 40 160)
  (send dc draw-rectangle 780 0 40 160))


; Make a frame by instantiating the frame% class
(define frame (new frame% (label "Keyboard")
                   (width 800) (height 300)
                   (min-width 800) (min-height 300)
                   (stretchable-height #f) (stretchable-width #f)))
 
; Make a static text message in the frame
(define msg (new message% (parent frame)
                          (label "Play a note:")))
  
; Derive a new canvas (a drawing window) class to handle events
(define keyboard%
  (class canvas% ; The base class is canvas%
    ; Define overriding method to handle mouse events
    (define/override (on-event event)
      (when (send event button-down? 'left)
        (determine-note-on-click event)))
    ; Define overriding method to handle keyboard events
    (define/override (on-char event)
      (determine-note-on-keyboard event))

    ; Call the superclass init, passing on all init args
    (super-new)))
 
; Make a canvas that handles events in the frame
(define keys
  (new keyboard% (parent frame)
       (paint-callback
        (lambda (canvas dc)
          (draw-keyboard dc)))
       (style (list 'border))))

; Show the frame by calling its show method
(send frame show #t)
