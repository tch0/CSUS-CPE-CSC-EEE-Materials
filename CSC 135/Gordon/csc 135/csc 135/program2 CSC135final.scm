;Amrit Singh
;Assignment2
;Dr. Scott Gordon
;11/06/18 (Turned in late within the 24 hour limit)

;-----------------------A-------------------------------
(define (isEven x)
  (if (= (modulo x 2) 0) #t #f))

(define (isOdd x)
  (if (not(= (modulo x 2) 0)) #t #f))

(define (isAllEven n);checks to see wether all given digits in an integer are even
  (cond
    [(< (/ n 10) 1) (isEven n)] ; if n/10 is < 1 we can assume n has been reduced to a single digit which we can pass to isEven.
    [else (and (isEven (modulo n 10)) (isAllEven (/ (- n (modulo n 10)) 10)))])) ; else we "and" the two resulting boolean values recursively checking evens

(define (isAllOdd n); checks to see wether all given digits in an integer are odd
  (cond
    [(<(/ n 10) 1) (isOdd n)];if n/10 is < 1 we can assume n has been reduced to a single digit which we can pass to isOdd.
    [else (and (isOdd (modulo n 10)) (isAllOdd (/ (- n (modulo n 10)) 10)))]));else we "and" the two resulting boolean values recursively checking odds

(define (ludicrous n)
  (cond
    [(= (modulo n 10) n) #t]; this will catch single digit integers
    [(= (modulo (modulo n 10) 2) 0 ) (isAllEven n)] ; if ((n%10) % 2) = 0, we can safely assume the last digit in an integer is even
    [(not(= (modulo n 10) 0)) (isAllOdd n)])); else we go to check if all digits are odd


;-------------------------------------------------------
;-----------------------B-------------------------------

(define(cappedSum I L) ; takes in an integer I and a list L
        (if (null? L) 0 ; if the list is null (empty)return 0
            (if( < I (car L)) (+ (car L)(cappedSum I (cdr L))); if integer < all elements in the list it will add the elements
               (+ I (cappedSum I (cdr L)))))); if there are numbers greater than I, I willl be added in place of those integers.

;--------------------------------------------------------
;------------------------C-------------------------------
(define (last L)
 (if (null? (cdr L)) (car L)
			(last (cdr L)))); this function was given to us in class, it defines the last element in a list

(define (removeLastElement L) ; this function takes in a list L and removes the last element 
  (if (null? (cdr L)) null ; if there is only one item in the list it returns a null (empty) list
      (cons (car L) (removeLastElement (cdr L))))) ; if there is more than one item then it will return the list with the last element removed

(define (reverseShuffle L M); this function takes two lists L and M as parameters
  (if (null? M) L; if one list or the other are null, it returns the non-null list.
      (if (null? L) M
          (cons (last M) (reverseShuffle L (removeLastElement M)))))); else it will take the last M element and prepend it to the L

          ;reverseshuffle does not work right :(.
;-----------------------------------------------------------
;--------------------------D--------------------------------

(define (countListElements L) ; this function counts the number of items in a list
  (if(null? L) 0              ; if the list is null the amount of elements = to 0
      (+ 1 (countListElements(cdr L) )))) ; else +1 for each element

;(define (biggestListSize L) ; this function takes in a list of lists as a parameter
 ; (if( null? L) 0); if the list is empty return 0
  ;(if (null? (cdr L)) (countListElements(car L)) ;if/when there is only one list in L, return the number of elements in L 
   ;   (if (< (countListElements(car L)) (countListElements(car (cdr L)))) (biggestListSize (cdr L)) ; if the list has less elements than the list after it, then recurse on the bigger list
    ;      (biggestListSize (cons (car L) (cdr(cdr L)))))))
(define (biggestListSize L); this function takes in a list of lists as a parameter
  (cond
    [( null? L) 0]; if the list is empty return 0
    [(null? (cdr L)) (countListElements(car L))];if/when there is only one list in L, return the number of elements in L (base case)
    [(< (countListElements(car L)) (countListElements(car (cdr L)))) (biggestListSize (cdr L))] ; if the list has less elements than the lists after it, then recurse on the bigger list
    [else   (biggestListSize (cons (car L) (cdr(cdr L))))]));else it will ignore the smaller list and move on

    
;-------------------------E--------------------------
;----------------------------------------------------
	;not complete
;-------------------------F--------------------------
;----------------------------------------------------
	;not complete
;-------------------------G--------------------------
;----------------------------------------------------
	;not complete
