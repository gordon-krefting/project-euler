(load (merge-pathnames "fizz-buzz.lisp" *load-pathname*))

(format t "~a~%" (fizz-buzz:fizz-buzz 1000))
