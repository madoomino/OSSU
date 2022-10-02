;; ensure-question-starter.rkt

; 
; PROBLEM:
; 
; Use the How to Design Functions (HtDF) recipe to design a function that consumes a string, and adds "?" 
; to the end unless the string already ends in "?".
; 
; For this question, assume the string has length > 0. Follow the HtDF recipe and leave behind commented 
; out versions of the stub and template.
; 


;; String -> String
;; Append a "?" to the end of a given string

(check-expect (addQuestionMark "Did you wake up early")"Did you wake up early?")

;(define (addQuestionMark str) "") ;stub
;(define (addQuestionMark str) ;template
;  (...str))

(define (addQuestionMark str)
  (string-append str "?"))
