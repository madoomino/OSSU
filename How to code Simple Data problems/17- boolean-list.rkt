;; boolean-list-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a list of booleans. Call it ListOfBoolean. 
; 


;; ListOfBoolean is one of:
;; - empty
;; - (cons Boolean  ListOfBoolean)
;; interp. list of booleans

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
  [else
   (... (first lon)
   (fn-for-lon (rest lon)))]))

;; Template rules used:
;;   one of: 2 cases:
;;    - atomic distinct value: empty
;;    - compund: (cons Boolean  ListOfBoolean)
;;    - self-reference: (rest lon) is ListOfBoolean

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that consumes a list of boolean values and produces true 
; if every value in the list is true. If the list is empty, your function 
; should also produce true. Call it all-true?
; 


;; ListOfBoolean -> Boolean
(check-expect (all-true? empty) true)
(check-expect (all-true? (cons true (cons false (cons true empty)))) false)
(check-expect (all-true? (cons true (cons true (cons true empty)))) true)

;(define (all-true? lon) false) ;stub

;took template from ListOfBoolean

(define (all-true? lon)
  (cond [(empty? lon) true]
  [else
   (if (false? (first lon))
       false
       (all-true? (rest lon)))]))
