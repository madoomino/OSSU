;; rocket-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are designing a program to track a rocket's journey as it descends 
; 100 kilometers to Earth. You are only interested in the descent from 
; 100 kilometers to touchdown. Once the rocket has landed it is done.
; 
; Design a data definition to represent the rocket's remaining descent. 
; Call it RocketDescent.
; 


; RocketDescent is one of:
; - Natural[0,100]
; - false
; interp. the distance between earth and rocket, false means that the rocket landed

(define RD1 100)
(define RD2 5)
(define RD3 false)

#;
(define (fn-for-rocket-descent rd)
  (cond [(and (number? rd)
              (> rd 0)
              (<= rd 100))
         (... rd)]
        [else (...)]))
        
;; Template rules used:
;; -one of 2 cases:
;;  -atomic non-distinct: Natural(0,100]
;;  -atomic distinct value: false
    
;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design a function that will output the rocket's remaining descent distance 
; in a short string that can be broadcast on Twitter. 
; When the descent is over, the message should be "The rocket has landed!".
; Call your function rocket-descent-to-msg.
; 


;; RocketDescent -> String
;; produces the rocket's remaining descent distance in a short string

(check-expect (rocket-descent-to-msg RD1) (string-append "The remaining distance is " (number->string RD1)))
(check-expect (rocket-descent-to-msg RD2) (string-append "The remaining distance is " (number->string RD2)))
(check-expect (rocket-descent-to-msg RD3) "The rocket has landed!")
  
;(define (rocket-descent-to-msg rd) "The rocket has landed!") ;stub

;<use template from RocketDescent>

(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd)
              (> rd 0)
              (<= rd 100))
         (string-append "The remaining distance is " (number->string rd))]
        [else "The rocket has landed!"]))
