;; Iteration:
;; LOOP overview
(loop
   ;; Initialize variables we loop over
   :for x :in '(1 3 5)
   :for i :from 1 :to 2 ;; ranges: to,below,downto…
   :for y := i :then 99

   ;; Use intermediate variables
   :with z := "z" ;; set once, not iterated.

   ;; Initial clause
   :initially (format t "initially, i = ~S" i)

   ;; Body.
   ;; Conditionals: if/else, when,
   ;; while, until, repeat
   :if (> i 90)
   :do (return i)  ;; early exit

   ;; Main clauses: ;; do, collect… into,
   ;; count, sum, maximize
   ;; thereis, always, never
   :sum x :into res

   ;; Final clause
   :finally (return (list i res)))
