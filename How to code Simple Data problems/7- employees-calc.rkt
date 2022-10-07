;; Data definitions:

; 
; PROBLEM A:
; 
; You work in the Human Resources department at a ski lodge. 
; Because the lodge is busier at certain times of year, 
; the number of employees fluctuates. 
; There are always more than 10, but the maximum is 50.
; 
; Design a data definition to represent the number of ski lodge employees. 
; Call it Employees.
; 


;; Employees is Natural[10,50]
;; interp. range of employees working at a ski lodge at one time

(define EMP1 15)
(define EMP2 10)
(define EMP3 50)

#;
(define (fn-for-employees e)
  (... e))

;; =================
;; Functions:

; 
; PROBLEM B:
; 
; Now design a function that will calculate the total payroll for the quarter.
; Each employee is paid $1,500 per quarter. Call it calculate-payroll.
; 


;; Employees -> Natural
;; calculates calculate the total payroll for the quarter (each employee is paid $1,500)

(check-expect (calculate-payroll EMP1) (* 15 1500))
(check-expect (calculate-payroll EMP2) (* 10 1500))
(check-expect (calculate-payroll EMP3) (* 50 1500))


              
;(define (calculate-payroll e) 0) ;stub

;<use the tamplate frome Employees>

(define (calculate-payroll e)
  (* e 1500))
