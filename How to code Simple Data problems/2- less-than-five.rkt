
;; less-than-five-starter.rkt

; 
; PROBLEM:
; 
; DESIGN function that consumes a string and determines whether its length is
; less than 5.  Follow the HtDF recipe and leave behind commented out versions 
; of the stub and template.
; 


;; Solution:

;; String -> Boolean
;; Checks if the given string is less than 5 chars

(check-expect (lessThanFive "madoo") false)
(check-expect (lessThanFive "mino") true)


;(define (lessThanFive str) false)  ;stub

;(define (lessThanFive str)         ;template
;  (...str))

(define (lessThanFive str)
  (< (string-length str) 5))
