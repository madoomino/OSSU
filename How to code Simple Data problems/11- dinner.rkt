
;; dinner-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; You are working on a system that will automate delivery for 
; YesItCanFly! airlines catering service. 
; There are three dinner options for each passenger, chicken, pasta 
; or no dinner at all. 
; 
; Design a data definition to represent a dinner order. Call the type 
; DinnerOrder.
; 


;; DinnerOrder is one of:
;; - checken
;; - pasta
;; - false
;;<examples are redundant from DinnerOrder>

#;
(define (fn-for-dinner-order do)
  (cond [(string=? do "checken") (...)]
        [(string=? do "pasta") (...)]
        [else (...)]))
        
;; Template rules used:
;; -one of 3 cases:
;; -atomic distinct value: "checken"
;; -atomic distinct value: "pasta"
;; -atomic distinct value: false
        
;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Design the function dinner-order-to-msg that consumes a dinner order 
; and produces a message for the flight attendants saying what the
; passenger ordered. 
; 
; For example, calling dinner-order-to-msg for a chicken dinner would
; produce "The passenger ordered chicken."
; 


;; DinnerOrder -> String
;; produces a message for the flight attendants saying what the passenger ordered

(check-expect (dinner-order-to-msg "chicken") "The passenger ordered chicken.")
(check-expect (dinner-order-to-msg "pasta") "The passenger ordered pasta.")
(check-expect (dinner-order-to-msg false) "The passenger didn't order.")

;(define (dinner-order-to-msg do) "") ;stub

;<use template from DinnerOrder>

;; First Approach:
(define (dinner-order-to-msg do)
  (if (boolean? do)
      "The passenger didn't order."
      (cond [(string=? do "chicken") "The passenger ordered chicken."]
        [(string=? do "pasta") "The passenger ordered pasta."])))
        
;; Second Approach
(define (dinner-order-to-msg do)
  (cond [(string=? do "no order") "The passenger didn't order."]  ; (replacing false by string)
        [(string=? do "chicken") "The passenger ordered chicken."]
        [(string=? do "pasta") "The passenger ordered pasta."]))
