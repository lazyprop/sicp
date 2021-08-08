#lang racket

(require "../huffman.rkt")

(define message '(
                  get a job sha na na na na na na na na
                  get a job sha na na na na na na na na
                  wah yip yip yip yip yip yip yip yip yip
                  sha boom
                  ))

(define pairs (list '(a 2)
                    '(boom 1)
                    '(get 2)
                    '(job 2)
                    '(na 16)
                    '(sha 3)
                    '(yip 9)
                    '(wah 1)))

(define sha-na-na-tree (generate-huffman-tree pairs))

(length (encode message sha-na-na-tree))
;; 84 bits are required for encoding

;; a fixed length code would require 3 bits per symbol as there are
;; 8 symbols

(* 3 (length message))
;; 108 bits would be required in a fixed length encoding
