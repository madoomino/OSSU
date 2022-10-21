
;; odd-from-n-starter.rkt

;  PROBLEM:
;  
;  Design a function called odd-from-n that consumes a natural number n, and produces a list of all 
;  the odd numbers from n down to 1. 
;  
;  Note that there is a primitive function, odd?, that produces true if a natural number is odd.
;  



;; Natural -> ListOfOdd

(check-expect (odd-from-n 0) empty)
(check-expect (odd-from-n 1) (cons 1 empty))
(check-expect (odd-from-n 2) (cons 1 empty))
(check-expect (odd-from-n 6) (cons 5 (cons 3 (cons 1 empty))))
(check-expect (odd-from-n 9) (cons 9 (cons 7 (cons 5 (cons 3 (cons 1 empty))))))

;(define (odd-from-n n) 0) ;stub

(define (odd-from-n n)
  (cond [(= n 0) empty]
        [else
         (if (= (remainder n 2) 0)
      (cons (- n 1) (odd-from-n (- n 2)))
      (cons n (odd-from-n (- n 1))))]))
