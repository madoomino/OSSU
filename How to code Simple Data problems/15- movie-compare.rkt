
;; movie-starter.rkt

;; =================
;; Data definitions:

; 
; PROBLEM A:
; 
; Design a data definition to represent a movie, including  
; title, budget, and year released.
; 
; To help you to create some examples, find some interesting movie facts below: 
; "Titanic" - budget: 200000000 released: 1997
; "Avatar" - budget: 237000000 released: 2009
; "The Avengers" - budget: 220000000 released: 2012
; 
; However, feel free to research more on your own!
; 


;; Movie is (make-movie String Number Number)
;; interp. Movie is a data definiton for movie details like title, budget, realsed year.
(define-struct movie (title budget year-realesed))

(define M1 (make-movie "Spirited Away" 500000 1998))

#;
(define (fn-for-mive m)
  (... (movie-title) ;String
       (movie-budget) ;Integer
       (movie-year-realesed))) ;Integer

;; Template rules used:
;;  - compound: 3 fields

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; You have a list of movies you want to watch, but you like to watch your 
; rentals in chronological order. Design a function that consumes two movies 
; and produces the title of the most recently released movie.
; 
; Note that the rule for templating a function that consumes two compound data 
; parameters is for the template to include all the selectors for both 
; parameters.
; 


;; Movie Movie -> String
;; produces the title of the most recently released movie.

(check-expect (recent-movie? (make-movie "alrahena" 50000 2006)
                             (make-movie "algzera" 505500 2009)) "algzera") 

(check-expect (recent-movie? (make-movie "a3dam mit" 20000 1992)
                             (make-movie "elalmani" 2 2015)) "elalmani")

(check-expect (recent-movie? (make-movie "a3dam mit" 20000 1992)
                             (make-movie "eltailandi" 2 1992)) "a3dam mit")

;(define (recent-movie? m1 m22) m1) ;stub

;took template from Movie

(define (recent-movie? m1 m2)
  (cond
    [(> (movie-year-realesed m1) (movie-year-realesed m2))
      (movie-title m1)]
    [(< (movie-year-realesed m1) (movie-year-realesed m2))
      (movie-title m2)]
    [else (movie-title m1)]))
