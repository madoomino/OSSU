;; bike-route-starter.rkt

; PROBLEM a:
; 
; Suppose you are developing a route planning tool for bicycling in Vancouver.
; There are four varieties of designated bike routes:
; 
; 1) Separated Bikeway
; 2) Local Street Bikeway
; 3) Painted Bike Lane
; 4) Painted Shared-Use Lane
; 
; Use the HtDD recipe to design a data definition for varieties of bike routes (call it BikeRoute)


;; BikeRoute is one of:
;;  - Separated Bikeway
;;  - Local Street Bikeway
;;  - Painted Bike Lane
;;  - Painted Shared-Use Lane
;; interp. Varieties of bike routes in Vancouver

;; <examples are redundant for enumerations>

#;
(define (fn-for-bike-route br)
  (cond [(string=? "Separated Bikeway" br)(...)]
        [(string=? "Local Street Bikeway" br)(...)]
        [(string=? "Painted Bike Lane" br)(...)]
        [else (...)]))

;; Template rules used:
;; - one of: 4 cases
;; - atomic distinct: "Separated Bikeway"
;; - atomic distinct: "Local Street Bikeway"
;; - atomic distinct: "Painted Bike Lane"
;; - atomic distinct: "Painted Shared-Use Lane"

; PROBLEM b:
; 
; Separated bikeways and painted bike lanes are exclusively designated for bicycles, while
; local street bikeways and shared-use lanes must be shared with cars and/or pedestrians.
; 
; Design a function called 'exclusive?' that takes a bike route and indicates whether it 
; is exclusively designated for bicycles.


;; BikeRoute -> Boolean
;; takes a bike route and indicates whether it is exclusively designated for bicycles

(check-expect (exclusive? "Separated Bikeway") true)
(check-expect (exclusive? "Local Street Bikeway") false)
(check-expect (exclusive? "Painted Bike Lane") false)
(check-expect (exclusive? "Painted Shared-Use Lane") true)

;(define (exclusive? br) false) ;stub

;<use template from BikeRoute>


(define (exclusive? br)
  (cond [(string=? "Separated Bikeway" br) true]
        [(string=? "Local Street Bikeway" br) false]
        [(string=? "Painted Bike Lane" br)false]
        [else true]))
