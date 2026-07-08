(load (merge-pathnames "fizz-buzz.lisp" *load-pathname*))

(defun check (name expected actual)
  (if (= expected actual)
      (format t "PASS ~a~%" name)
      (progn
        (format t "FAIL ~a: expected ~a, got ~a~%" name expected actual)
        (sb-ext:exit :code 1))))

(check "fizz-buzz 10" 23 (fizz-buzz:fizz-buzz 10))
(check "fizz-buzz 1000" 233168 (fizz-buzz:fizz-buzz 1000))
