;; insert-starter.rkt

; 
; PROBLEM:
; 
; Design a function that consumes an Integer, String and BST, and adds a node
; that has the given key and value to the tree. The node should be add-nodededeed in 
; the proper place in the tree. The function can assume there is not already 
; an entry for that number in the tree. The function should produce the new BST.
; 
; Do not worry about keeping the tree balanced. We will come back to this later.
; 


;; Data definitions:

(define-struct node (key val l r))
;; A BST (Binary Search Tree) is one of:
;;  - false
;;  - (make-node Integer String BST BST)
;; interp. false means no BST, or empty BST
;;         key is the node key
;;         val is the node val
;;         l and r are left and right subtrees
;; INVARIANT: for a given node:
;;     key is > all keys in its l(eft)  child
;;     key is < all keys in its r(ight) child
;;     the same key never appears twice in the tree

(define BST0 false)
(define BST1 (make-node 1 "abc" false false))
(define BST4 (make-node 4 "dcj" false (make-node 7 "ruf" false false)))
(define BST3 (make-node 3 "ilk" BST1 BST4))
(define BST42 
  (make-node 42 "ily"
             (make-node 27 "wit" (make-node 14 "olp" false false) false)
             false))
(define BST10 (make-node 10 "why" BST3 BST42))

; .

#;
(define (fn-for-bst t)
  (cond [(false? t) (...)]
        [else
         (... (node-key t)    ;Integer
              (node-val t)    ;String
              (fn-for-bst (node-l t))
              (fn-for-bst (node-r t)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic-distinct: false
;;  - compound: (make-node Integer String BST BST)
;;  - self reference: (node-l t) has type BST
;;  - self reference: (node-r t) has type BST

; 
; PROBLEM:
; 
; Design a function that consumes an Integer, String and BST, and adds a node
; that has the given key and value to the tree. The node should be inserted in 
; the proper place in the tree. The function can assume there is not already 
; an entry for that number in the tree. The function should produce the new BST.
; 
; Do not worry about keeping the tree balanced. We will come back to this later.



;; Integer String BST -> BST
;; adds a node that has the given key and value to the tree

(check-expect (add-node 1 "hi" BST0) (make-node 1 "hi" false false))

(check-expect (add-node 3 "hi" BST1)
              (make-node 1 "abc" false (make-node 3 "hi" false false)))
(check-expect (add-node 2 "b" false) 
              (make-node 2 "b" false false))
(check-expect (add-node 1 "a" 
                      (make-node 2 "b" false false))
              (make-node 2 "b" (make-node 1 "a" false false) false))
(check-expect (add-node 3 "c" 
                      (make-node 2 "b" (make-node 1 "a" false false) false))
              (make-node 2 "b" 
                         (make-node 1 "a" false false)
                         (make-node 3 "c" false false)))

;(define (add-node int str t) false) ;stub

(define (add-node int str bst)
  (cond [(false? bst) (make-node int str false false)]
        [else
         (if (< int (node-key bst))
             (make-node (node-key bst) (node-val bst)
                        (add-node int str (node-l bst)) (node-r bst))
             (make-node (node-key bst) (node-val bst)
                        (node-l bst) (add-node int str (node-r bst))))]))
